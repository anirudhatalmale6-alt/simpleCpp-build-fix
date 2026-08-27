// reserved.c — C names that are assembler keywords.
//
// A C identifier is not automatically a legal assembler symbol. In Intel
// syntax `sp`, `ax`, `ch`, `gs` and `si` are registers and `flat`, `ptr`,
// `offset`, `short` and `word` are keywords, so a global or function with one
// of those names used to produce a file that looked correct and would not
// assemble:
//
//     Error: `[rip+sp]' is not a valid base/index expression
//
// The compiler now renames them on the way out, to a form containing a dot so
// the new name cannot collide with any real C identifier. This file only has
// to build and print the right numbers -- if the renaming is inconsistent
// between the definition and the use, it will not link.

#include "nano-nolibc.h"

long sp    = 11;                  // register
long ax[3] = { 1, 2, 3 };         // register
char ch    = 'Z';                 // register
long gs    = 5;                   // segment register
long si    = 7;                   // register
long word  = 13;                  // size keyword
long ptr   = 17;                  // operand keyword
long offset_of_nothing = 19;      // not reserved -- must be left alone
char *st   = "st is the x87 stack";

long flat(long n) { return n * 2; }        // Intel-syntax keyword
long dword(long n) { return n + 100; }     // size keyword

int main() {
    sp = sp + 1;
    printf("sp ch gs si = %d %c %d %d\n", sp, ch, gs, si);
    printf("ax          = %d %d %d\n", ax[0], ax[1], ax[2]);
    printf("word ptr    = %d %d\n", word, ptr);
    printf("untouched   = %d\n", offset_of_nothing);
    printf("st          = %s\n", st);
    printf("flat dword  = %d %d\n", flat(21), dword(21));
    return 0;
}
