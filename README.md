# simpleC-


Feature,Status
Full C expression parsing with correct precedence,✅
if / else / while / return,✅
Local + global variables,✅
Functions with up to 6 register args (System V ABI),✅
struct definitions,✅
class with public: / private:,✅
new / delete (C++ sugar),✅
"Pointers, "&", "*,✅
#define and #include preprocessor,✅
"__asm__(""..."")" inline assembly,✅
Macro expansion inside asm strings (e.g. #define VGA 0xB8000 → "__asm__(""mov rdi, VGA"")"),✅
Real x86_64 System V output,✅