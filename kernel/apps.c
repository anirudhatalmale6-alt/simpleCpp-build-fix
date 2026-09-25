// apps.c — the GUI toolkit running as a PROCESS, and a crash that does not
// take the machine with it.
//
// The client asked the right question: "should we build this inside the os as
// an app instead of a demo, that way when it crashes its not taking whole
// system with it". This image is the answer, and the answer has two halves
// that have to be shown separately.
//
//   1. The apps really are processes. Same nano-ui.h the kernel images
//      compile -- not a port, not a copy, the same file -- drawing into a
//      buffer the program owns and reaching the screen through SYS_WINBLIT.
//      Nothing in user/uidemo.c calls a kernel function.
//
//   2. A fault in one is survivable. uidemo has a button that dereferences a
//      null pointer on purpose. The machine has to still be here afterwards,
//      still scheduling, still drawing, and able to run the program AGAIN.
//
// The second half is the one worth being careful about. "It did not hang" is
// not the same as "it recovered" -- a kernel that silently wedged its
// scheduler would also fail to print anything further, and so would a kernel
// that was fine but had nothing left to say. So the checks after the crash
// are things that can only be true if the system is still WORKING: the tick
// count advances, a second process starts and finishes, and the window count
// went back down.

// ORDER MATTERS HERE, and it is not stylistic. nano-int.h wraps the whole
// syscall dispatch in `#ifdef NANO_PROC_H`, so including it BEFORE nano-proc.h
// compiles the int 0x80 handler out entirely. The kernel then builds, boots,
// spawns a process, and that process hangs on its first syscall with nothing
// printed and no fault -- which reads exactly like a broken program.
//
// Every other image that runs processes puts nano-proc.h first. So does this
// one now.
#include "nano-kernel.h"
#include "nano-fb.h"
#include "nano-mouse.h"
#include "nano-mm.h"
#include "nano-thread.h"
#include "nano-fs.h"
#include "nano-wm.h"
#include "nano-wmin.h"
#include "nano-proc.h"
#include "nano-int.h"
#include "nano-term.h"

long g_fail;

void fail(char *msg) {
    printf("FAIL: %s\n", msg);
    g_fail = g_fail + 1;
}

void expect_true(char *what, long cond) {
    if (cond) printf("  ok  %s\n", what);
    else fail(what);
}

void expect(char *what, long got, long want) {
    if (got == want) printf("  ok  %s = %d\n", what, got);
    else {
        printf("  got %d, wanted %d\n", got, want);
        fail(what);
    }
}

extern long prog_uidemo_addr();
extern long prog_uidemo_size();
extern long prog_hello_addr();
extern long prog_hello_size();

long install(char *path, long addr, long size) {
    long ino;
    ino = fs_create(path);
    if (!ino) { printf("could not create %s\n", path); return 0; }
    if (fs_write(ino, 0, (char *)addr, size) != size) {
        printf("short write installing %s\n", path);
        return 0;
    }
    return ino;
}

// How many windows the window manager currently has. The app's window
// appearing and then going away again is the outside evidence that a process
// started and stopped.
long window_count() {
    long i;
    long n;
    n = 0;
    i = 0;
    while (i < WM_MAXWIN) { if (g_win[i].used) n = n + 1; i = i + 1; }
    return n;
}

// Run the app until it has been alive for `ticks`, polling the process table
// the way a shell would. Returns 1 if it was still running at the end.
long run_for(long pid, long ticks) {
    long t0;
    t0 = g_ticks;
    while (g_ticks - t0 < ticks) {
        proc_poll();
        wm_present();
        if (!proc_alive(pid)) return 0;
        thread_yield();
    }
    return proc_alive(pid);
}

void main_thread(long unused) {
    long pid;
    long before;
    long ticks_before;
    char *av[2];

    puts("\nnano-os: the widgets, as a process\n");

    if (!fs_format(2048, 128)) { fail("format failed"); }
    // fs_create does not make parent directories, and a program has to live
    // somewhere. The error without this is "could not create /bin/uidemo",
    // which reads like a permissions problem rather than a missing folder.
    if (!fs_mkdir("/bin")) fail("mkdir /bin");

    puts("\n-- 1. the app is a real program --\n");
    expect_true("uidemo is embedded in the image", prog_uidemo_size() > 1000);
    expect_true("...and installs onto the filesystem",
                install("/bin/uidemo", prog_uidemo_addr(), prog_uidemo_size()) > 0);

    // A control: does ANY process run and print in this image? If hello is
    // silent too then the fault is in this file's setup, not in uidemo.
    {
        long hp;
        char *hav[2];
        install("/bin/hello", prog_hello_addr(), prog_hello_size());
        hav[0] = "/bin/hello";
        hp = proc_spawn("/bin/hello", 1, hav, "hello", "/");
        expect_true("the control program spawns", hp != 0);
        if (hp) {
            long t0;
            t0 = g_ticks;
            while (g_ticks - t0 < 30 && proc_alive(hp)) { proc_poll(); thread_yield(); }
            expect_true("...and it finished", proc_alive(hp) == 0);
        }
    }

    before = window_count();
    expect("no windows before it runs", before, 0);

    av[0] = "/bin/uidemo";
    pid = proc_spawn("/bin/uidemo", 1, av, "uidemo", "/");
    expect_true("it spawned", pid != 0);
    if (!pid) {
        printf("  reject: %s\n", proc_reject);
        puts("\nAPPSTEST DONE\n");
        cpu_halt_forever();
    }

    // Give it long enough to open its window and draw a frame.
    run_for(pid, 40);
    expect("the PROCESS opened a window", window_count(), before + 1);
    expect_true("...and is still running", proc_alive(pid) == 1);

    // It drew through the same nano-ui.h the kernel compiles. The evidence
    // that it drew at all is pixels in the window that are not the colour it
    // cleared to -- a window full of the clear colour would mean the toolkit
    // produced nothing.
    {
        long i;
        long j;
        long w;
        long ink;
        long hnd;
        hnd = -1;
        i = 0;
        while (i < WM_MAXWIN) { if (g_win[i].used) hnd = i; i = i + 1; }
        ink = 0;
        if (hnd >= 0) {
            w = g_win[hnd].w;
            j = 0;
            while (j < g_win[hnd].h) {
                i = 0;
                while (i < w) {
                    long c;
                    c = g_win[hnd].pix[j * w + i];
                    if (c != rgb(46, 50, 60)) ink = ink + 1;
                    i = i + 1;
                }
                j = j + 1;
            }
        }
        expect_true("...and the widgets actually drew into it", ink > 2000);
        printf("  %d pixels differ from the clear colour\n", ink);
    }

    puts("\n-- 2. and now the part this milestone is for --\n");
    puts("  telling it to dereference a null pointer\n");

    ticks_before = g_ticks;

    // Send it the key it crashes on.
    //
    // A KEYSTROKE rather than a click on its button, deliberately: clicking
    // would mean computing the button's pixel position from the toolkit's
    // layout constants, which this file does not include and which change the
    // moment a row is added above it. The key goes through the same ring the
    // real keyboard fills, so it reaches the process by exactly the path a
    // typed character does.
    {
        long t0;
        long hnd;
        long i;
        // SYS_WINPOLL hands a key to the FOCUSED window only -- deliberately,
        // so a background program cannot eat what is being typed at whatever
        // the user is looking at. A window opened by a process is not focused
        // just because it exists, so the key went into the ring and stayed
        // there. Focus it first, which is what clicking on it would do.
        hnd = -1;
        i = 0;
        while (i < WM_MAXWIN) { if (g_win[i].used) hnd = i; i = i + 1; }
        if (hnd >= 0) wm_set_focus(hnd);

        kbd_push('x');
        t0 = g_ticks;
        while (g_ticks - t0 < 60 && proc_alive(pid)) {
            proc_poll();
            wm_present();
            thread_yield();
        }
    }

    expect_true("the process is gone", proc_alive(pid) == 0);

    // THE CHECKS THAT MATTER. Each of these can only pass if the machine is
    // still working, rather than merely still printing.
    expect_true("the clock is still running", g_ticks > ticks_before);

    {
        long t0;
        long moved;
        t0 = g_ticks;
        moved = 0;
        while (g_ticks - t0 < 10) { thread_yield(); }
        moved = (g_ticks - t0 >= 10);
        expect_true("...and the scheduler still hands out time", moved == 1);
    }

    expect("the crashed program's window was cleaned up", window_count(), before);

    // And the strongest one: run it AGAIN. A kernel that survived the fault
    // but left the process table, the address-space allocator or the window
    // manager in a broken state would fail here rather than above.
    puts("\n-- 3. and it can still run programs afterwards --\n");
    av[0] = "/bin/uidemo";
    pid = proc_spawn("/bin/uidemo", 1, av, "uidemo2", "/");
    expect_true("a SECOND run spawns after the crash", pid != 0);
    if (pid) {
        run_for(pid, 40);
        expect_true("...opens its window", window_count() == before + 1);
        expect_true("...and is running", proc_alive(pid) == 1);
    }

    printf("\nheap: %d pages mapped\n", heap_pages);
    if (g_fail) printf("\n%d CHECKS FAILED\n", g_fail);
    else puts("\nPASS: the widgets run as a process, and a crash is survivable\n");
    puts("\nAPPSTEST DONE\n");

    // Leave it up so the image is usable by hand as well as by the test.
    puts("apps up; the machine is now interactive\n");
    for (;;) {
        proc_poll();
        wm_present();
        cpu_idle();
    }
}

int main() {
    serial_init();
    g_fail = 0;
    if (!fb_init(1024, 768)) { puts("fb_init failed\n"); for (;;) { } }
    if (!mm_init())          { puts("mm_init failed\n"); for (;;) { } }
    mm_protect_null();
    kbd_init();
    interrupts_init(100);
    thread_init();
    // Without this, g_next_pid is 0 and the FIRST successful spawn returns a
    // pid of 0 -- which every caller, including this file's own test, reads
    // as failure. The symptom was "it spawned: FAIL" with an EMPTY rejection
    // reason, because nothing had rejected anything.
    proc_init();

    wm_init(rgb(24, 28, 38));
    wmin_init();
    mouse_state_reset();
    mouse_bounds(fb_width, fb_height);

    thread_create((long)main_thread, 0, "main");
    sched_start();
    return 0;
}
