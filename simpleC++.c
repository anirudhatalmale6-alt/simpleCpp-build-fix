#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdarg.h>

// =====================================================================
// 1. GLOBALS & ERROR HANDLING
// =====================================================================
FILE *fout;
int line = 1;
void error(char *m) { fprintf(stderr, "Error line %d: %s\n", line, m); exit(1); }
void emit(char *fmt, ...) {
    va_list a; va_start(a, fmt); vfprintf(fout, fmt, a); va_end(a);
    fprintf(fout, "\n");
}

// =====================================================================
// 2. PREPROCESSOR: #define, #include, macro expansion
// =====================================================================
#define MAX_MACROS 256
#define MAX_SRC    200000
char src[MAX_SRC];
int  src_len = 0;

typedef struct { char name[64]; char value[256]; } Macro;
Macro macros[MAX_MACROS];
int   macro_cnt = 0;

void macro_expand(char *out, const char *in) {
    // Expand macros in a string (used for __asm__ bodies and #define values)
    int i = 0, j = 0;
    while (in[i]) {
        if (isalpha(in[i]) || in[i] == '_') {
            int start = i;
            while (isalnum(in[i]) || in[i] == '_') i++;
            char word[64]; int k = 0;
            for (int s = start; s < i; s++) word[k++] = in[s];
            word[k] = 0;
            int found = 0;
            for (int m = 0; m < macro_cnt; m++) {
                if (!strcmp(word, macros[m].name)) {
                    strcpy(&out[j], macros[m].value);
                    j += strlen(macros[m].value);
                    found = 1; break;
                }
            }
            if (!found) { for (int s = start; s < i; s++) out[j++] = in[s]; }
        } else {
            out[j++] = in[i++];
        }
    }
    out[j] = 0;
}

void load_file(const char *name) {
    FILE *f = fopen(name, "r");
    if (!f) { fprintf(stderr, "Cannot open %s\n", name); exit(1); }
    int c;
    while ((c = fgetc(f)) != EOF) {
        if (src_len >= MAX_SRC - 1) error("Source too large");
        if (c == '#') {
            char dir[20]; int i = 0;
            while ((c = fgetc(f)) != EOF && isalpha(c)) dir[i++] = c;
            dir[i] = 0;
            while (isspace(c)) c = fgetc(f);
            if (!strcmp(dir, "define")) {
                i = 0;
                while (c != EOF && (isalnum(c) || c == '_')) {
                    macros[macro_cnt].name[i++] = c; c = fgetc(f);
                }
                macros[macro_cnt].name[i] = 0;
                while (isspace(c)) c = fgetc(f);
                i = 0;
                while (c != '\n' && c != EOF) {
                    macros[macro_cnt].value[i++] = c; c = fgetc(f);
                }
                macros[macro_cnt].value[i] = 0;
                macro_cnt++;
                if (c == '\n') line++;
            } else if (!strcmp(dir, "include")) {
                char fname[256]; int i = 0;
                if (c == '"') {
                    while ((c = fgetc(f)) != '"' && c != EOF) fname[i++] = c;
                } else if (c == '<') {
                    while ((c = fgetc(f)) != '>' && c != EOF) fname[i++] = c;
                }
                fname[i] = 0;
                load_file(fname);
            }
        } else {
            src[src_len++] = c;
            if (c == '\n') line++;
        }
    }
    src[src_len] = 0;
    fclose(f);
}

// =====================================================================
// 3. LEXER
// =====================================================================
enum {
    T_NUM, T_ID, T_STR,
    T_PLUS, T_MINUS, T_STAR, T_SLASH, T_PERCENT,
    T_EQ, T_EQEQ, T_NEQ, T_LT, T_GT, T_LTE, T_GTE,
    T_AND, T_OR, T_NOT, T_AMP, T_PIPE,
    T_LP, T_RP, T_LB, T_RB, T_LC, T_RC,
    T_SEMI, T_COMMA, T_DOT, T_ARROW, T_COLON, T_SCOPE,
    T_INT, T_CHAR, T_VOID, T_IF, T_ELSE, T_WHILE, T_RETURN,
    T_STRUCT, T_CLASS, T_PUBLIC, T_PRIVATE, T_NEW, T_DELETE, T_ASM,
    T_EOF
};
int tok, ival;
char id[256], str_val[1024];
int  pos = 0;

void skip_ws() {
    while (pos < src_len && isspace(src[pos])) pos++;
}

void next() {
    skip_ws();
    if (pos >= src_len) { tok = T_EOF; return; }
    int c = src[pos];

    if (isdigit(c)) {
        ival = 0;
        while (pos < src_len && isdigit(src[pos])) { ival = ival * 10 + (src[pos] - '0'); pos++; }
        tok = T_NUM; return;
    }
    if (isalpha(c) || c == '_') {
        int i = 0;
        while (pos < src_len && (isalnum(src[pos]) || src[pos] == '_')) id[i++] = src[pos++];
        id[i] = 0; tok = T_ID;
        if      (!strcmp(id, "int"))    tok = T_INT;
        else if (!strcmp(id, "char"))   tok = T_CHAR;
        else if (!strcmp(id, "void"))   tok = T_VOID;
        else if (!strcmp(id, "if"))     tok = T_IF;
        else if (!strcmp(id, "else"))   tok = T_ELSE;
        else if (!strcmp(id, "while"))  tok = T_WHILE;
        else if (!strcmp(id, "return")) tok = T_RETURN;
        else if (!strcmp(id, "struct")) tok = T_STRUCT;
        else if (!strcmp(id, "class"))  tok = T_CLASS;
        else if (!strcmp(id, "public")) tok = T_PUBLIC;
        else if (!strcmp(id, "private"))tok = T_PRIVATE;
        else if (!strcmp(id, "new"))    tok = T_NEW;
        else if (!strcmp(id, "delete")) tok = T_DELETE;
        else if (!strcmp(id, "__asm__") || !strcmp(id, "asm")) tok = T_ASM;
        return;
    }
    if (c == '"') {
        pos++; int i = 0;
        while (pos < src_len && src[pos] != '"') {
            if (src[pos] == '\\') { pos++; }
            str_val[i++] = src[pos++];
        }
        str_val[i] = 0; pos++;
        tok = T_STR; return;
    }
    pos++;
    int c2 = (pos < src_len) ? src[pos] : 0;
    if (c == '=' && c2 == '=') { pos++; tok = T_EQEQ; return; }
    if (c == '!' && c2 == '=') { pos++; tok = T_NEQ; return; }
    if (c == '<' && c2 == '=') { pos++; tok = T_LTE; return; }
    if (c == '>' && c2 == '=') { pos++; tok = T_GTE; return; }
    if (c == '-' && c2 == '>') { pos++; tok = T_ARROW; return; }
    if (c == ':' && c2 == ':') { pos++; tok = T_SCOPE; return; }
    switch (c) {
        case '+': tok = T_PLUS;   return;
        case '-': tok = T_MINUS;  return;
        case '*': tok = T_STAR;   return;
        case '/': tok = T_SLASH;  return;
        case '%': tok = T_PERCENT;return;
        case '=': tok = T_EQ;     return;
        case '<': tok = T_LT;     return;
        case '>': tok = T_GT;     return;
        case '&': tok = T_AMP;    return;
        case '|': tok = T_PIPE;   return;
        case '!': tok = T_NOT;    return;
        case '(': tok = T_LP;     return;
        case ')': tok = T_RP;     return;
        case '[': tok = T_LB;     return;
        case ']': tok = T_RB;     return;
        case '{': tok = T_LC;     return;
        case '}': tok = T_RC;     return;
        case ';': tok = T_SEMI;   return;
        case ',': tok = T_COMMA;  return;
        case '.': tok = T_DOT;    return;
        case ':': tok = T_COLON;  return;
    }
    error("Unknown character");
}

void expect(int t) {
    if (tok != t) { fprintf(stderr, "Line %d: expected token %d, got %d\n", line, t, tok); exit(1); }
    next();
}

// =====================================================================
// 4. TYPE SYSTEM & SYMBOL TABLE
// =====================================================================
enum { TY_INT, TY_CHAR, TY_VOID, TY_PTR, TY_STRUCT, TY_FUNC };

typedef struct Type Type;
typedef struct Sym  Sym;

struct Type {
    int ty;
    int size;
    Type *base;         // for TY_PTR
    Sym  *members;      // for TY_STRUCT
    char  name[64];     // struct name
};

struct Sym {
    char  name[64];
    Type *type;
    int   offset;       // stack offset (locals) or 0 (globals)
    int   is_global;
    Sym  *next;
};

Sym  *globals = NULL, *locals = NULL, *structs = NULL;
int   local_offset = 0;

Type *int_type, *char_type, *void_type;

Type* new_type(int ty) {
    Type *t = calloc(1, sizeof(Type));
    t->ty = ty;
    t->size = (ty == TY_CHAR) ? 1 : 8;
    return t;
}
Sym* new_sym(const char *name, Type *type) {
    Sym *s = calloc(1, sizeof(Sym));
    strncpy(s->name, name, 63);
    s->type = type;
    return s;
}
Sym* find_sym(const char *name, Sym *list) {
    while (list) { if (!strcmp(list->name, name)) return list; list = list->next; }
    return NULL;
}
void init_types() {
    int_type  = new_type(TY_INT);
    char_type = new_type(TY_CHAR);
    void_type = new_type(TY_VOID); void_type->size = 0;
}

// =====================================================================
// 5. PARSER — forward declarations
// =====================================================================
int label_cnt = 0;
int new_label() { return label_cnt++; }

Type* parse_expr();
Type* parse_assign();
Type* parse_eq();
Type* parse_rel();
Type* parse_add();
Type* parse_mul();
Type* parse_unary();
Type* parse_primary();
void  parse_stmt();
void  parse_block();
Type* parse_decl_or_stmt();
Type* parse_decl();
Type* parse_struct_def();

// =====================================================================
// 6. EXPRESSIONS
// =====================================================================
Type* parse_primary() {
    if (tok == T_NUM) {
        emit("    mov rax, %d", ival);
        next();
        return int_type;
    }
    if (tok == T_STR) {
        // String literals: emit in .rodata, load address
        static int str_cnt = 0;
        char lbl[32]; sprintf(lbl, ".LC%d", str_cnt++);
        emit(".section .rodata");
        emit("%s: .string \"%s\"", lbl, str_val);
        emit(".section .text");
        emit("    lea rax, [rip + %s]", lbl);
        next();
        Type *t = new_type(TY_PTR); t->base = char_type; return t;
    }
    if (tok == T_ID) {
        char name[256]; strcpy(name, id); next();

        // Function call
        if (tok == T_LP) {
            next();
            int argc = 0;
            const char *regs[] = {"rdi","rsi","rdx","rcx","r8","r9"};
            while (tok != T_RP) {
                parse_assign();
                if (argc < 6) emit("    mov %s, rax", regs[argc]);
                else          emit("    push rax");
                argc++;
                if (tok == T_COMMA) next();
            }
            expect(T_RP);
            emit("    call %s", name);
            if (argc > 6) emit("    add rsp, %d", (argc - 6) * 8);
            return int_type;
        }

        // new Type
        // (handled below in unary)

        // Variable lookup
        Sym *s = find_sym(name, locals);
        if (!s) s = find_sym(name, globals);
        if (!s) {
            // Assume it's an external function reference
            emit("    lea rax, [rip + %s]", name);
            Type *ft = new_type(TY_FUNC); return ft;
        }
        if (s->type->ty == TY_FUNC) {
            emit("    lea rax, [rip + %s]", name);
            return s->type;
        }
        if (s->is_global) emit("    lea rax, [rip + %s]", name);
        else              emit("    lea rax, [rbp - %d]", s->offset);

        // Auto-deref for non-pointer, non-struct types
        if (s->type->ty != TY_PTR && s->type->ty != TY_STRUCT) {
            if (s->type->size == 1) emit("    movsx rax, byte ptr [rax]");
            else                    emit("    mov rax, [rax]");
        }
        return s->type;
    }
    if (tok == T_LP) {
        next();
        Type *t = parse_assign();
        expect(T_RP);
        return t;
    }
    error("Invalid expression");
    return NULL;
}

Type* parse_unary() {
    if (tok == T_AMP) { // address-of
        next();
        Type *t = parse_primary();
        Type *p = new_type(TY_PTR); p->base = t; p->size = 8;
        // primary already left the address in rax for locals/globals
        return p;
    }
    if (tok == T_STAR) { // deref
        next();
        Type *t = parse_unary();
        emit("    mov rax, [rax]");
        if (t->ty == TY_PTR && t->base) return t->base;
        return int_type;
    }
    if (tok == T_MINUS) {
        next();
        parse_unary();
        emit("    neg rax");
        return int_type;
    }
    if (tok == T_NOT) {
        next();
        parse_unary();
        emit("    test rax, rax");
        emit("    sete al");
        emit("    movzx rax, al");
        return int_type;
    }
    if (tok == T_NEW) { // C++ new
        next();
        Type *base = int_type;
        if (tok == T_INT)  { next(); base = int_type; }
        else if (tok == T_CHAR) { next(); base = char_type; }
        else if (tok == T_ID) {
            Sym *s = find_sym(id, structs);
            if (s) { base = s->type; next(); }
            else next();
        }
        emit("    mov rdi, %d", base->size);
        emit("    call malloc");
        Type *p = new_type(TY_PTR); p->base = base; p->size = 8;
        return p;
    }
    if (tok == T_DELETE) { // C++ delete
        next();
        parse_unary();
        emit("    mov rdi, rax");
        emit("    call free");
        emit("    xor rax, rax");
        return void_type;
    }
    return parse_primary();
}

Type* parse_mul() {
    Type *t = parse_unary();
    while (tok == T_STAR || tok == T_SLASH || tok == T_PERCENT) {
        int op = tok; next();
        emit("    push rax");
        parse_unary();
        emit("    mov rcx, rax");
        emit("    pop rax");
        if (op == T_STAR)        emit("    imul rax, rcx");
        else if (op == T_SLASH)  { emit("    cqo"); emit("    idiv rcx"); }
        else                     { emit("    cqo"); emit("    idiv rcx"); emit("    mov rax, rdx"); }
    }
    return t;
}

Type* parse_add() {
    Type *t = parse_mul();
    while (tok == T_PLUS || tok == T_MINUS) {
        int op = tok; next();
        emit("    push rax");
        parse_mul();
        emit("    mov rcx, rax");
        emit("    pop rax");
        if (op == T_PLUS)  emit("    add rax, rcx");
        else               emit("    sub rax, rcx");
    }
    return t;
}

Type* parse_rel() {
    Type *t = parse_add();
    while (tok == T_LT || tok == T_GT || tok == T_LTE || tok == T_GTE) {
        int op = tok; next();
        emit("    push rax");
        parse_add();
        emit("    mov rcx, rax");
        emit("    pop rax");
        emit("    cmp rax, rcx");
        if (op == T_LT)       emit("    setl al");
        else if (op == T_GT)  emit("    setg al");
        else if (op == T_LTE) emit("    setle al");
        else                  emit("    setge al");
        emit("    movzx rax, al");
    }
    return t;
}

Type* parse_eq() {
    Type *t = parse_rel();
    while (tok == T_EQEQ || tok == T_NEQ) {
        int op = tok; next();
        emit("    push rax");
        parse_rel();
        emit("    mov rcx, rax");
        emit("    pop rax");
        emit("    cmp rax, rcx");
        if (op == T_EQEQ) emit("    sete al");
        else              emit("    setne al");
        emit("    movzx rax, al");
    }
    return t;
}

Type* parse_assign() {
    // We need to handle lvalues for assignment.
    // Simplified: if we see ID = expr, handle it here.
    if (tok == T_ID) {
        int saved_pos = pos;
        int saved_tok = tok;
        char name[256]; strcpy(name, id);
        next();
        if (tok == T_EQ) {
            next();
            Sym *s = find_sym(name, locals);
            if (!s) s = find_sym(name, globals);
            if (!s) error("Assignment to undeclared variable");
            Type *val = parse_assign();
            if (s->is_global) emit("    lea rcx, [rip + %s]", name);
            else              emit("    lea rcx, [rbp - %d]", s->offset);
            emit("    mov [rcx], rax");
            return s->type;
        }
        // Not an assignment — rewind and parse as normal expression
        pos = saved_pos;
        tok = saved_tok;
        // Re-read the identifier
        int i = 0;
        while (pos < src_len && (isalnum(src[pos]) || src[pos] == '_')) id[i++] = src[pos++];
        id[i] = 0;
    }
    return parse_eq();
}

Type* parse_expr() {
    return parse_assign();
}

// =====================================================================
// 7. STATEMENTS
// =====================================================================
void parse_stmt() {
    if (tok == T_IF) {
        next();
        expect(T_LP); parse_expr(); expect(T_RP);
        int L1 = new_label(), L2 = new_label();
        emit("    test rax, rax");
        emit("    jz .L%d", L1);
        parse_stmt();
        emit("    jmp .L%d", L2);
        emit(".L%d:", L1);
        if (tok == T_ELSE) { next(); parse_stmt(); }
        emit(".L%d:", L2);
        return;
    }
    if (tok == T_WHILE) {
        next();
        int L1 = new_label(), L2 = new_label();
        emit(".L%d:", L1);
        expect(T_LP); parse_expr(); expect(T_RP);
        emit("    test rax, rax");
        emit("    jz .L%d", L2);
        parse_stmt();
        emit("    jmp .L%d", L1);
        emit(".L%d:", L2);
        return;
    }
    if (tok == T_RETURN) {
        next();
        parse_expr();
        expect(T_SEMI);
        emit("    leave");
        emit("    ret");
        return;
    }
    if (tok == T_LC) {
        parse_block();
        return;
    }
    if (tok == T_ASM) {
        // Inline assembly: __asm__("...");
        next();
        expect(T_LP);
        if (tok != T_STR) error("Expected string literal in __asm__");
        // Expand macros inside the asm string
        char expanded[2048];
        macro_expand(expanded, str_val);
        next();
        expect(T_RP);
        expect(T_SEMI);
        // Emit each line of the asm string as its own instruction
        char *p = expanded;
        while (*p) {
            while (*p && isspace(*p)) p++;
            if (!*p) break;
            char line_buf[512]; int i = 0;
            while (*p && *p != ';' && *p != '\n') line_buf[i++] = *p++;
            line_buf[i] = 0;
            if (*p == ';') p++;
            if (i > 0) emit("    %s", line_buf);
        }
        return;
    }
    // Declaration or expression statement
    if (tok == T_INT || tok == T_CHAR || tok == T_VOID || tok == T_STRUCT || tok == T_CLASS) {
        parse_decl();
        return;
    }
    parse_expr();
    expect(T_SEMI);
}

void parse_block() {
    expect(T_LC);
    while (tok != T_RC && tok != T_EOF) parse_stmt();
    expect(T_RC);
}

// =====================================================================
// 8. DECLARATIONS (variables, functions, structs, classes)
// =====================================================================
Type* parse_struct_def() {
    // struct Name { int x; int y; };
    next(); // consume 'struct' or 'class'
    char name[64]; strcpy(name, id); expect(T_ID);
    Type *st = new_type(TY_STRUCT);
    strncpy(st->name, name, 63);
    st->size = 0;
    Sym *tail = NULL;
    expect(T_LC);
    while (tok != T_RC) {
        // Skip access specifiers
        if (tok == T_PUBLIC || tok == T_PRIVATE) { next(); expect(T_COLON); continue; }
        Type *mt = int_type;
        if (tok == T_CHAR)      { mt = char_type; next(); }
        else if (tok == T_INT)  { next(); }
        else if (tok == T_VOID) { next(); }
        char mname[64]; strcpy(mname, id); expect(T_ID);
        Sym *m = new_sym(mname, mt);
        m->offset = st->size;
        st->size += mt->size;
        if (!st->members) { st->members = m; tail = m; }
        else              { tail->next = m; tail = m; }
        expect(T_SEMI);
    }
    expect(T_RC);
    expect(T_SEMI);
    Sym *s = new_sym(name, st);
    s->next = structs; structs = s;
    return st;
}

void parse_decl() {
    if (tok == T_STRUCT || tok == T_CLASS) {
        // Could be definition or variable declaration
        int saved = pos;
        next();
        char name[64]; strcpy(name, id); next();
        if (tok == T_LC) {
            pos = saved;
            parse_struct_def();
            return;
        }
        // Variable of struct type: struct Name var;
        pos = saved;
        next(); // struct/class
        Sym *s = find_sym(id, structs);
        if (!s) error("Unknown struct/class");
        Type *st = s->type;
        next(); // name of struct
        char vname[64]; strcpy(vname, id); expect(T_ID);
        Sym *v = new_sym(vname, st);
        v->offset = local_offset; local_offset += st->size;
        v->next = locals; locals = v;
        if (tok == T_SEMI) { next(); return; }
        // TODO: initialization
        expect(T_SEMI);
        return;
    }

    Type *base = int_type;
    if (tok == T_CHAR)      { base = char_type; next(); }
    else if (tok == T_INT)  { next(); }
    else if (tok == T_VOID) { base = void_type; next(); }

    char name[64]; strcpy(name, id); expect(T_ID);

    // Function definition
    if (tok == T_LP) {
        next();
        Sym *prev_locals = locals;
        int   prev_off   = local_offset;
        locals = NULL; local_offset = 0;

        const char *regs[] = {"rdi","rsi","rdx","rcx","r8","r9"};
        int arg_idx = 0;
        while (tok != T_RP) {
            Type *pt = int_type;
            if (tok == T_CHAR)      { pt = char_type; next(); }
            else if (tok == T_INT)  { next(); }
            else if (tok == T_VOID) { next(); }
            char pname[64]; strcpy(pname, id); expect(T_ID);
            Sym *p = new_sym(pname, pt);
            p->offset = 0; // will be set below
            p->next = locals; locals = p;
            if (tok == T_COMMA) next();
        }
        expect(T_RP);

        // Assign offsets to parameters (they arrive in regs, we store on stack)
        // Walk locals list (it's reversed), assign offsets
        Sym *p = locals;
        int idx = 0;
        // Since locals is a reversed list, we need to re-reverse or just assign
        // Simpler: re-walk in reverse by counting
        int param_count = 0;
        for (Sym *q = locals; q; q = q->next) param_count++;
        // Assign offsets in reverse order of the list (which is forward order of params)
        Sym *arr[16]; int ai = 0;
        for (Sym *q = locals; q; q = q->next) arr[ai++] = q;
        for (int i = ai - 1; i >= 0; i--) {
            arr[i]->offset = local_offset;
            local_offset += 8;
        }

        emit("%s:", name);
        emit("    push rbp");
        emit("    mov rbp, rsp");
        // Allocate stack space (align to 16)
        int stack_size = (local_offset + 15) & ~15;
        if (stack_size > 0) emit("    sub rsp, %d", stack_size);

        // Move registers into their stack slots
        for (int i = 0; i < ai && i < 6; i++) {
            emit("    mov [rbp - %d], %s", arr[i]->offset, regs[i]);
        }

        parse_block();

        emit("    leave");
        emit("    ret");

        locals = prev_locals;
        local_offset = prev_off;
        return;
    }

    // Variable declaration
    Type *vt = base;
    if (tok == T_STAR) {
        Type *p = new_type(TY_PTR); p->base = base; p->size = 8;
        vt = p;
        next();
    }
    Sym *v = new_sym(name, vt);
    if (locals != NULL || local_offset > 0) {
        // Local variable
        v->offset = local_offset;
        local_offset += vt->size;
        v->next = locals; locals = v;
        v->is_global = 0;
    } else {
        // Global variable
        v->is_global = 1;
        v->next = globals; globals = v;
    }
    if (tok == T_EQ) {
        next();
        parse_assign();
        if (v->is_global) emit("    mov [rip + %s], rax", name);
        else              emit("    mov [rbp - %d], rax", v->offset);
    }
    expect(T_SEMI);
}

// =====================================================================
// 9. MAIN
// =====================================================================
int main(int argc, char **argv) {
    if (argc < 3) {
        fprintf(stderr, "Usage: %s <input.c> <output.s>\n", argv[0]);
        return 1;
    }
    load_file(argv[1]);
    fout = fopen(argv[2], "w");
    if (!fout) { perror("fopen"); return 1; }

    init_types();

    emit("    .section .text");
    emit("    .global main");

    next();
    while (tok != T_EOF) {
        parse_decl();
    }

    // Emit globals in .bss
    emit("    .section .bss");
    for (Sym *g = globals; g; g = g->next) {
        emit("%s: resb %d", g->name, g->type->size);
    }

    fclose(fout);
    printf("Compiled %s -> %s\n", argv[1], argv[2]);
    return 0;
}