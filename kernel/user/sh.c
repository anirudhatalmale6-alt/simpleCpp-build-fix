// sh.c — the shell, as an app.
//
// It exists to start other programs, which until this milestone a process
// could not do at all: there was no SYS_SPAWN, only the kernel could call
// proc_spawn, and fd 1 was hardcoded to the console inside SYS_WRITE with no
// indirection anywhere. Both are fixed now, and this is what they were for.
//
// NOT A TERMINAL EMULATOR. There are no escape sequences, no cursor
// addressing, no scrollback search. It is a scrolling output pane and an
// input line, built from the widgets that already exist -- ui_edit for the
// output (read-only, so it gets the scrollbar and the line handling for
// free) and ui_text for the prompt. A real VT-style terminal is a different
// and much larger thing, and saying so now is cheaper than half-building one.
//
// Builtins are handled here; anything else is a program. `cd` has to be a
// builtin because a child changing its own directory would tell the parent
// nothing, which is the same reason it is a builtin in every other shell.

#include "nano-uiapp.h"
#include "nano-ui.h"

#define W 620
#define H 420

long g_pix[W * H];
struct Ui g_ui;
long g_hnd;
long g_quit;

// The output pane is an Edit the user cannot type into: it gets the
// scrollbar, the line table and the gutter-free rendering already written
// and tested, rather than a second implementation of the same thing.
struct Edit g_out;
char g_outbuf[ED_CAP];

// The input line's widget id. Any value that no automatic id will collide
// with; the automatic ones start at 0 and count the widgets in a frame.
#define SH_INPUT_ID 90

char g_line[160];
char g_cwd[128];

// The child currently running, if any. The shell keeps drawing while it runs
// -- a GUI program that froze until its child finished would look like the
// machine had hung, which is exactly what this milestone is against.
long g_child;
char g_childname[64];

void out_str(char *s) {
    long i;
    i = 0;
    while (s[i]) {
        // Straight into the buffer rather than through ed_key: ed_key runs
        // the caret and scroll rules for a person typing, and this is output
        // arriving. Append, then re-layout once at the end.
        if (g_out.len < ED_CAP - 2) {
            g_out.buf[g_out.len] = s[i];
            g_out.len = g_out.len + 1;
        }
        i = i + 1;
    }
    g_out.buf[g_out.len] = 0;
    ed_layout(&g_out);
    // Follow the tail, the way a console does.
    g_out.caret = g_out.len;
    ed_scroll_to_caret(&g_out);
}

void out_num(long v) {
    char b[24];
    long i;
    long neg;
    neg = (v < 0);
    if (neg) v = 0 - v;
    i = 23;
    b[i] = 0;
    if (v == 0) { i = i - 1; b[i] = '0'; }
    while (v > 0) { i = i - 1; b[i] = '0' + (v % 10); v = v / 10; }
    if (neg) { i = i - 1; b[i] = '-'; }
    out_str(&b[i]);
}

void str_copy(char *dst, char *src, long cap) {
    long i;
    i = 0;
    while (src[i] && i < cap - 1) { dst[i] = src[i]; i = i + 1; }
    dst[i] = 0;
}

long str_len(char *s) { long i; i = 0; while (s[i]) i = i + 1; return i; }

void path_join(char *out, char *dir, char *name, long cap) {
    long n;
    if (name[0] == '/') { str_copy(out, name, cap); return; }
    str_copy(out, dir, cap);
    n = str_len(out);
    if (n > 0 && out[n - 1] != '/') { out[n] = '/'; n = n + 1; out[n] = 0; }
    str_copy(out + n, name, cap - n);
}

// ---------- the parser ----------
//
// Words separated by spaces, with two redirections. Deliberately small: the
// miniShell parser handles far more, and wiring all of it in before the
// kernel can even pipe would be building on something not yet there.
#define MAXARGV 8

char g_words[MAXARGV][64];
long g_nwords;
char g_redir_out[96];
char g_redir_in[96];

// Returns 0 on a parse error, having said why.
long parse(char *s) {
    long i;
    long w;

    g_nwords = 0;
    g_redir_out[0] = 0;
    g_redir_in[0] = 0;
    i = 0;

    while (s[i]) {
        long mode;
        char tok[64];
        long t;

        while (s[i] == ' ' || s[i] == '\t') i = i + 1;
        if (!s[i]) break;

        mode = 0;                       // 0 = word, 1 = >, 2 = <
        if (s[i] == '>') { mode = 1; i = i + 1; }
        else if (s[i] == '<') { mode = 2; i = i + 1; }
        while (s[i] == ' ' || s[i] == '\t') i = i + 1;

        t = 0;
        while (s[i] && s[i] != ' ' && s[i] != '\t' && s[i] != '>' && s[i] != '<') {
            if (t < 63) { tok[t] = s[i]; t = t + 1; }
            i = i + 1;
        }
        tok[t] = 0;

        if (t == 0) {
            if (mode) { out_str("sh: redirection with no file\n"); return 0; }
            continue;
        }

        if (mode == 1) { str_copy(g_redir_out, tok, 96); continue; }
        if (mode == 2) { str_copy(g_redir_in, tok, 96); continue; }

        if (g_nwords >= MAXARGV) { out_str("sh: too many arguments\n"); return 0; }
        str_copy(g_words[g_nwords], tok, 64);
        g_nwords = g_nwords + 1;
    }
    return 1;
}

// ---------- builtins ----------

long builtin(char *cmd) {
    if (!ustrcmp(cmd, "cd")) {
        char want[128];
        if (g_nwords < 2) { str_copy(g_cwd, "/", 128); return 1; }
        path_join(want, g_cwd, g_words[1], 128);
        // Check it before adopting it. A cd to a file, or to nothing, would
        // otherwise poison every later relative path with no clue why.
        if (isdir_(want) != 1) { out_str("cd: not a directory: "); out_str(want); out_str("\n"); return 1; }
        str_copy(g_cwd, want, 128);
        return 1;
    }
    if (!ustrcmp(cmd, "pwd")) { out_str(g_cwd); out_str("\n"); return 1; }
    if (!ustrcmp(cmd, "clear")) {
        ed_init(&g_out, g_outbuf);
        return 1;
    }
    if (!ustrcmp(cmd, "exit")) { g_quit = 1; return 1; }
    if (!ustrcmp(cmd, "ls")) {
        long i;
        char nm[64];
        i = 0;
        while (i < 96) {
            if (readdir_(g_cwd, i, nm) <= 0) { i = i + 1; continue; }
            if (!ustrcmp(nm, ".")) { i = i + 1; continue; }
            out_str("  ");
            out_str(nm);
            {
                char full[160];
                path_join(full, g_cwd, nm, 160);
                if (isdir_(full) == 1) out_str("/");
            }
            out_str("\n");
            i = i + 1;
        }
        return 1;
    }
    if (!ustrcmp(cmd, "help")) {
        out_str("builtins: cd pwd ls clear help exit\n");
        out_str("anything else is run as a program from /bin\n");
        out_str("redirection: prog > file   and   prog < file\n");
        out_str("pipes are not in the kernel yet\n");
        return 1;
    }
    return 0;
}

// ---------- running a program ----------

// Everything the shell does also goes to stdout, which for the shell itself
// is the console. A GUI program whose only output is its own window cannot be
// diagnosed from a log, and this one starts other programs -- the one thing
// most worth having a record of.
void trace(char *s) { write(1, s, str_len(s)); }

void run(char *line) {
    char path[160];
    char *av[MAXARGV];
    long i;
    long outfd;
    long infd;

    trace("sh: run ["); trace(line); trace("]\n");
    if (!parse(line)) return;
    if (g_nwords == 0) { trace("sh: nothing to run\n"); return; }
    if (builtin(g_words[0])) { trace("sh: builtin\n"); return; }

    // A bare name means /bin/name; anything with a slash is taken as given.
    {
        long has_slash;
        has_slash = 0;
        i = 0;
        while (g_words[0][i]) { if (g_words[0][i] == '/') has_slash = 1; i = i + 1; }
        if (has_slash) path_join(path, g_cwd, g_words[0], 160);
        else { str_copy(path, "/bin/", 160); str_copy(path + 5, g_words[0], 155); }
    }

    outfd = 0 - 1;
    infd = 0 - 1;
    if (g_redir_out[0]) {
        char f[160];
        path_join(f, g_cwd, g_redir_out, 160);
        // Truncate first: `prog > file` means the file becomes the output,
        // not the output spliced onto whatever was there.
        ftruncate_(f);
        outfd = open(f, O_WRONLY | O_CREAT);
        trace("sh: redirect out -> "); trace(f); trace(outfd < 0 ? " FAILED\n" : " ok\n");
        if (outfd < 0) { out_str("sh: cannot write "); out_str(f); out_str("\n"); return; }
    }
    if (g_redir_in[0]) {
        char f[160];
        path_join(f, g_cwd, g_redir_in, 160);
        infd = open(f, O_RDONLY);
        if (infd < 0) {
            out_str("sh: cannot read "); out_str(f); out_str("\n");
            if (outfd >= 0) close(outfd);
            return;
        }
    }

    i = 0;
    while (i < g_nwords) { av[i] = g_words[i]; i = i + 1; }

    g_child = spawn(path, g_nwords, av, outfd, infd);

    // The shell's copies close now. The child got its own, so this does not
    // shut the child's end -- and leaving them open would leak a descriptor
    // per command until the table filled.
    if (outfd >= 0) close(outfd);
    if (infd >= 0) close(infd);

    trace("sh: spawn "); trace(path); trace(g_child ? " ok\n" : " FAILED\n");
    if (!g_child) {
        out_str("sh: cannot run "); out_str(path); out_str("\n");
        return;
    }
    str_copy(g_childname, path, 64);
    out_str("["); out_num(g_child); out_str("] "); out_str(path); out_str("\n");
}

// ---------- one frame ----------

void frame() {
    ui_begin(&g_ui, 0, 6, 6, W - 12);

    ui_row(&g_ui, 2);
    ui_label(&g_ui, "nano-os shell");
    ui_label(&g_ui, g_cwd);

    ui_row(&g_ui, 1);
    ui_edit(&g_ui, &g_out, 300);

    ui_row(&g_ui, 1);
    // A FIXED id, so the input line can be focused without anyone clicking
    // it. Widgets take keystrokes only when ui->focus is theirs, and focus is
    // normally set by a click -- which is right for a form and wrong for a
    // shell, where the whole point is that you start typing. The id is set
    // explicitly because the automatic ones depend on how many widgets were
    // drawn before this one, and that changes whenever the layout does.
    ui_id(&g_ui, SH_INPUT_ID);
    ui_text(&g_ui, g_line, 160);

    ui_row(&g_ui, 3);
    if (ui_button(&g_ui, "Run")) {
        if (g_line[0]) {
            out_str("$ "); out_str(g_line); out_str("\n");
            run(g_line);
            g_line[0] = 0;
        }
    }
    if (ui_button(&g_ui, "Clear")) ed_init(&g_out, g_outbuf);
    if (ui_button(&g_ui, "Quit")) g_quit = 1;

    ui_end(&g_ui);
}

int main(int argc, char **argv) {
    long poll[6];
    long prev_down;
    long i;

    i = 0;
    while (i < W * H) { g_pix[i] = rgb(236, 238, 242); i = i + 1; }

    g_hnd = win_open(90, 80, W + 8, H + 28, "shell");
    if (g_hnd < 0) { write(1, "sh: no window\n", 14); return 1; }

    sfc_bind(g_pix, W, H);
    ui_init(&g_ui);
    ui_forget_all();
    ed_init(&g_out, g_outbuf);
    str_copy(g_cwd, "/", 128);
    g_line[0] = 0;
    g_child = 0;
    prev_down = 0;
    // Typing works from the moment it opens.
    g_ui.focus = SH_INPUT_ID;

    out_str("nano-os shell. Type a command and press Run, or Enter.\n");
    out_str("`help` lists the builtins.\n\n");

    sfc_input(0, 0, W, H);
    ui_input(&g_ui, 0, 0, 0, 0);
    frame();
    win_blit(g_hnd, g_pix, W, H, 0);
    win_present(g_hnd);
    write(1, "sh: up\n", 7);

    while (!g_quit) {
        long down;
        long pressed;
        long released;
        long key;
        long redraw;

        if (win_poll(g_hnd, poll) < 0) break;

        down = poll[2] & 1;
        pressed = (down && !prev_down);
        released = (!down && prev_down);
        prev_down = down;
        key = poll[3];
        redraw = 0;

        // Enter runs the line, which is what a shell is. The key is consumed
        // here rather than handed to the widgets, or ui_text would insert it.
        if (key == '\n' || key == '\r') {
            if (g_line[0]) {
                out_str("$ "); out_str(g_line); out_str("\n");
                run(g_line);
                g_line[0] = 0;
            }
            key = 0;
            redraw = 1;
            // Back to the input line: running a command should not leave the
            // shell unable to accept the next one.
            g_ui.focus = SH_INPUT_ID;
        }

        // Reap a finished child and report how it went. Polled rather than
        // waited on: a syscall that slept in the kernel on a process that
        // might never exit is a hang with no way out of it.
        if (g_child) {
            long st;
            st = waitpid_(g_child);
            if (st >= 0) {
                out_str("["); out_num(g_child); out_str("] ");
                out_str(g_childname);
                out_str(" exited ");
                out_num(st);
                out_str("\n");
                g_child = 0;
                redraw = 1;
            }
        }

        if (pressed || released || key || down || redraw) {
            sfc_input(poll[0], poll[1], poll[4], poll[5]);
            ui_input(&g_ui, down, pressed, released, key);
            sfc_clear_damage();
            frame();
            if (sfc_dirty()) {
                win_blit(g_hnd, g_pix, W, H, 0);
                win_present(g_hnd);
            }
        }
        nap(20);
    }

    win_close(g_hnd);
    write(1, "sh: exited cleanly\n", 19);
    return 0;
}
