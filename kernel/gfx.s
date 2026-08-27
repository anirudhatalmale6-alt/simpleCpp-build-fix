.intel_syntax noprefix
    .section .text
    .globl main
vga_put:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov [rbp - 8], rdi
    lea rax, [rbp - 16]
    push rax
    mov rax, 753664
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 10
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L0
    lea rax, [rip + vga_col]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    lea rax, [rip + vga_row]
    push rax
    lea rax, [rip + vga_row]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L1
.L0:
    lea rax, [rbp - 24]
    push rax
    lea rax, [rip + vga_row]
    mov rax, [rax]
    push rax
    mov rax, 80
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    lea rax, [rip + vga_col]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    imul rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    pop rcx
    mov [rcx], al
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 15
    pop rcx
    mov [rcx], al
    lea rax, [rip + vga_col]
    push rax
    lea rax, [rip + vga_col]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rip + vga_col]
    mov rax, [rax]
    push rax
    mov rax, 80
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setge al
    movzx rax, al
    test rax, rax
    jz .L2
    lea rax, [rip + vga_col]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    lea rax, [rip + vga_row]
    push rax
    lea rax, [rip + vga_row]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L3
.L2:
.L3:
.L1:
    lea rax, [rip + vga_row]
    mov rax, [rax]
    push rax
    mov rax, 25
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setge al
    movzx rax, al
    test rax, rax
    jz .L4
    lea rax, [rip + vga_row]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    jmp .L5
.L4:
.L5:
    leave
    ret
vga_clear:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    lea rax, [rbp - 8]
    push rax
    mov rax, 753664
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 16]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L6:
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 80
    push rax
    mov rax, 25
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L7
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 32
    pop rcx
    mov [rcx], al
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 15
    pop rcx
    mov [rcx], al
    lea rax, [rbp - 16]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L6
.L7:
    lea rax, [rip + vga_row]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    lea rax, [rip + vga_col]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    leave
    ret
serial_init:
    push rbp
    mov rbp, rsp
    mov rax, 1016
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 0
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outb
    mov rax, 1016
    push rax
    mov rax, 3
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 128
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outb
    mov rax, 1016
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 3
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outb
    mov rax, 1016
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 0
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outb
    mov rax, 1016
    push rax
    mov rax, 3
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 3
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outb
    mov rax, 1016
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 199
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outb
    mov rax, 1016
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 11
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outb
    leave
    ret
serial_put:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
.L8:
    mov rax, 1016
    push rax
    mov rax, 5
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    pop rdi
    xor eax, eax
    call inb
    push rax
    mov rax, 32
    mov rcx, rax
    pop rax
    and rax, rcx
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L9
    jmp .L8
.L9:
    mov rax, 1016
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outb
    leave
    ret
putc:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 10
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L10
    mov rax, 13
    push rax
    pop rdi
    xor eax, eax
    call serial_put
    jmp .L11
.L10:
.L11:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    pop rdi
    xor eax, eax
    call serial_put
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    pop rdi
    xor eax, eax
    call vga_put
    leave
    ret
puts:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
.L12:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    test rax, rax
    jz .L13
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    pop rdi
    xor eax, eax
    call putc
    lea rax, [rbp - 8]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L12
.L13:
    leave
    ret
print_int:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    mov [rbp - 8], rdi
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L14
    mov rax, 48
    push rax
    pop rdi
    xor eax, eax
    call putc
    leave
    ret
    jmp .L15
.L14:
.L15:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L16
    mov rax, 45
    push rax
    pop rdi
    xor eax, eax
    call putc
    lea rax, [rbp - 8]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    neg rax
    pop rcx
    mov [rcx], rax
    jmp .L17
.L16:
.L17:
    lea rax, [rbp - 40]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L18:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setg al
    movzx rax, al
    test rax, rax
    jz .L19
    lea rax, [rbp - 32]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 48
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 10
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    mov rax, rdx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], al
    lea rax, [rbp - 40]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 10
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    pop rcx
    mov [rcx], rax
    jmp .L18
.L19:
.L20:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setg al
    movzx rax, al
    test rax, rax
    jz .L21
    lea rax, [rbp - 40]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 32]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    movsx rax, byte ptr [rax]
    push rax
    pop rdi
    xor eax, eax
    call putc
    jmp .L20
.L21:
    leave
    ret
strcmp:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
.L22:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    test rax, rax
    jz .L24
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L24
    mov rax, 1
    jmp .L25
.L24:
    mov rax, 0
.L25:
    test rax, rax
    jz .L23
    lea rax, [rbp - 8]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 16]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L22
.L23:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    leave
    ret
    leave
    ret
_put_uint:
    push rbp
    mov rbp, rsp
    sub rsp, 64
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    lea rax, [rbp - 64]
    push rax
    .section .rodata
.LC26: .string "0123456789abcdef"
    .section .text
    lea rax, [rip + .LC26]
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L27
    mov rax, 48
    push rax
    pop rdi
    xor eax, eax
    call putc
    leave
    ret
    jmp .L28
.L27:
.L28:
    lea rax, [rbp - 56]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L29:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setg al
    movzx rax, al
    test rax, rax
    jz .L30
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 64]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    mov rax, rdx
    mov rcx, rax
    pop rax
    add rax, rcx
    movsx rax, byte ptr [rax]
    pop rcx
    mov [rcx], al
    lea rax, [rbp - 56]
    push rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    pop rcx
    mov [rcx], rax
    jmp .L29
.L30:
.L31:
    lea rax, [rbp - 56]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setg al
    movzx rax, al
    test rax, rax
    jz .L32
    lea rax, [rbp - 56]
    push rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    movsx rax, byte ptr [rax]
    push rax
    pop rdi
    xor eax, eax
    call putc
    jmp .L31
.L32:
    leave
    ret
printf:
    push rbp
    mov rbp, rsp
    sub rsp, 80
    mov [rbp - 8], rdi
    mov [rbp - 80], rdi
    mov [rbp - 72], rsi
    mov [rbp - 64], rdx
    mov [rbp - 56], rcx
    mov [rbp - 48], r8
    mov [rbp - 40], r9
    lea rax, [rbp - 16]
    mov rcx, rax
    lea rax, [rbp - 72]
    mov [rcx], rax
.L33:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    test rax, rax
    jz .L34
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    mov rax, 37
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L35
    lea rax, [rbp - 8]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    mov rax, 100
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L37
    lea rax, [rbp - 24]
    push rax
    lea rax, [rbp - 16]
    mov rcx, rax
    mov rax, [rcx]
    mov rdx, [rax]
    add rax, 8
    mov [rcx], rax
    mov rax, rdx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L39
    mov rax, 45
    push rax
    pop rdi
    xor eax, eax
    call putc
    lea rax, [rbp - 24]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    neg rax
    pop rcx
    mov [rcx], rax
    jmp .L40
.L39:
.L40:
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 10
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call _put_uint
    jmp .L38
.L37:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    mov rax, 120
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L41
    lea rax, [rbp - 16]
    mov rcx, rax
    mov rax, [rcx]
    mov rdx, [rax]
    add rax, 8
    mov [rcx], rax
    mov rax, rdx
    push rax
    mov rax, 16
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call _put_uint
    jmp .L42
.L41:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    mov rax, 115
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L43
    lea rax, [rbp - 32]
    push rax
    lea rax, [rbp - 16]
    mov rcx, rax
    mov rax, [rcx]
    mov rdx, [rax]
    add rax, 8
    mov [rcx], rax
    mov rax, rdx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    pop rdi
    xor eax, eax
    call puts
    jmp .L44
.L43:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    mov rax, 99
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L45
    lea rax, [rbp - 16]
    mov rcx, rax
    mov rax, [rcx]
    mov rdx, [rax]
    add rax, 8
    mov [rcx], rax
    mov rax, rdx
    push rax
    pop rdi
    xor eax, eax
    call putc
    jmp .L46
.L45:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    mov rax, 37
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L47
    mov rax, 37
    push rax
    pop rdi
    xor eax, eax
    call putc
    jmp .L48
.L47:
    mov rax, 37
    push rax
    pop rdi
    xor eax, eax
    call putc
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    pop rdi
    xor eax, eax
    call putc
.L48:
.L46:
.L44:
.L42:
.L38:
    jmp .L36
.L35:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    pop rdi
    xor eax, eax
    call putc
.L36:
    lea rax, [rbp - 8]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L33
.L34:
    leave
    ret
kbd_init:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    lea rax, [rbp - 8]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L49:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 128
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L50
    lea rax, [rip + g_keymap]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], al
    lea rax, [rbp - 8]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L49
.L50:
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 49
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 3
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 50
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 51
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 5
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 52
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 6
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 53
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 7
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 54
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 55
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 9
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 56
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 10
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 57
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 11
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 48
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 16
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 113
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 17
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 119
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 18
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 101
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 19
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 114
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 20
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 116
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 21
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 121
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 22
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 117
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 23
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 105
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 24
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 111
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 25
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 112
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 30
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 97
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 31
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 115
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 32
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 100
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 33
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 102
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 34
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 103
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 35
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 104
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 36
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 106
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 37
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 107
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 38
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 108
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 44
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 122
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 45
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 120
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 46
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 99
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 47
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 118
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 48
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 98
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 49
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 110
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 50
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 109
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 57
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 32
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 28
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 10
    pop rcx
    mov [rcx], al
    lea rax, [rip + g_keymap]
    push rax
    mov rax, 14
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 8
    pop rcx
    mov [rcx], al
    leave
    ret
keyboard_getchar:
    push rbp
    mov rbp, rsp
    sub rsp, 16
.L51:
.L54:
    mov rax, 100
    push rax
    pop rdi
    xor eax, eax
    call inb
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    and rax, rcx
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L55
    jmp .L54
.L55:
    lea rax, [rbp - 8]
    push rax
    mov rax, 96
    push rax
    pop rdi
    xor eax, eax
    call inb
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 128
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L56
    lea rax, [rbp - 16]
    push rax
    lea rax, [rip + g_keymap]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    movsx rax, byte ptr [rax]
    pop rcx
    mov [rcx], al
    lea rax, [rbp - 16]
    movsx rax, byte ptr [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setne al
    movzx rax, al
    test rax, rax
    jz .L58
    lea rax, [rbp - 16]
    movsx rax, byte ptr [rax]
    leave
    ret
    jmp .L59
.L58:
.L59:
    jmp .L57
.L56:
.L57:
.L52:
    jmp .L51
.L53:
    leave
    ret
kernel_init:
    push rbp
    mov rbp, rsp
    xor eax, eax
    call serial_init
    xor eax, eax
    call vga_clear
    xor eax, eax
    call kbd_init
    leave
    ret
vbe_write:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov rax, 462
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outw
    mov rax, 463
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outw
    leave
    ret
vbe_read:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
    mov rax, 462
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outw
    mov rax, 463
    push rax
    pop rdi
    xor eax, eax
    call inw
    leave
    ret
    leave
    ret
pci_read32:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    mov [rbp - 32], rcx
    lea rax, [rbp - 40]
    push rax
    mov rax, 2147483648
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 40]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 65536
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 40]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 2048
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 40]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 256
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 40]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    mov rax, 252
    mov rcx, rax
    pop rax
    and rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    mov rax, 3320
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outl
    mov rax, 3324
    push rax
    pop rdi
    xor eax, eax
    call inl
    leave
    ret
    leave
    ret
pci_write32:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    mov [rbp - 32], rcx
    mov [rbp - 40], r8
    lea rax, [rbp - 48]
    push rax
    mov rax, 2147483648
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 65536
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 2048
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 256
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    mov rax, 252
    mov rcx, rax
    pop rax
    and rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    mov rax, 3320
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outl
    mov rax, 3324
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call outl
    leave
    ret
pci_find_framebuffer:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    lea rax, [rbp - 8]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L60:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 32
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L61
    lea rax, [rbp - 16]
    push rax
    mov rax, 0
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    push rax
    mov rax, 0
    push rax
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call pci_read32
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 1
    neg rax
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setne al
    movzx rax, al
    test rax, rax
    jz .L64
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 65535
    mov rcx, rax
    pop rax
    and rax, rcx
    push rax
    mov rax, 65535
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setne al
    movzx rax, al
    test rax, rax
    jz .L64
    mov rax, 1
    jmp .L65
.L64:
    mov rax, 0
.L65:
    test rax, rax
    jz .L62
    lea rax, [rbp - 24]
    push rax
    mov rax, 0
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    push rax
    mov rax, 8
    push rax
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call pci_read32
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 24
    mov rcx, rax
    pop rax
    sar rax, cl
    push rax
    mov rax, 255
    mov rcx, rax
    pop rax
    and rax, rcx
    push rax
    mov rax, 3
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L66
    lea rax, [rbp - 32]
    push rax
    mov rax, 0
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    push rax
    mov rax, 16
    push rax
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call pci_read32
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    and rax, rcx
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L68
    lea rax, [rbp - 40]
    push rax
    mov rax, 0
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    push rax
    mov rax, 4
    push rax
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call pci_read32
    pop rcx
    mov [rcx], rax
    mov rax, 0
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    push rax
    mov rax, 4
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    or rax, rcx
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    or rax, rcx
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call pci_write32
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    mov rax, 4294967280
    mov rcx, rax
    pop rax
    and rax, rcx
    leave
    ret
    jmp .L69
.L68:
.L69:
    jmp .L67
.L66:
.L67:
    jmp .L63
.L62:
.L63:
    lea rax, [rbp - 8]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L60
.L61:
    mov rax, 0
    leave
    ret
    leave
    ret
fb_init:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    lea rax, [rip + fb_ok]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 24]
    push rax
    mov rax, 0
    push rax
    pop rdi
    xor eax, eax
    call vbe_read
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 45248
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jnz .L72
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 45263
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setg al
    movzx rax, al
    test rax, rax
    jnz .L72
    mov rax, 0
    jmp .L73
.L72:
    mov rax, 1
.L73:
    test rax, rax
    jz .L70
    mov rax, 0
    leave
    ret
    jmp .L71
.L70:
.L71:
    mov rax, 4
    push rax
    mov rax, 0
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call vbe_write
    mov rax, 1
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call vbe_write
    mov rax, 2
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call vbe_write
    mov rax, 3
    push rax
    mov rax, 32
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call vbe_write
    mov rax, 4
    push rax
    mov rax, 1
    push rax
    mov rax, 64
    mov rcx, rax
    pop rax
    or rax, rcx
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call vbe_write
    lea rax, [rip + fb_width]
    push rax
    mov rax, 1
    push rax
    pop rdi
    xor eax, eax
    call vbe_read
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_height]
    push rax
    mov rax, 2
    push rax
    pop rdi
    xor eax, eax
    call vbe_read
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_bpp]
    push rax
    mov rax, 3
    push rax
    pop rdi
    xor eax, eax
    call vbe_read
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jnz .L78
    lea rax, [rip + fb_height]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jnz .L78
    mov rax, 0
    jmp .L79
.L78:
    mov rax, 1
.L79:
    test rax, rax
    jnz .L76
    lea rax, [rip + fb_bpp]
    mov rax, [rax]
    push rax
    mov rax, 32
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setne al
    movzx rax, al
    test rax, rax
    jnz .L76
    mov rax, 0
    jmp .L77
.L76:
    mov rax, 1
.L77:
    test rax, rax
    jz .L74
    mov rax, 0
    leave
    ret
    jmp .L75
.L74:
.L75:
    lea rax, [rip + fb_pitch]
    push rax
    mov rax, 6
    push rax
    pop rdi
    xor eax, eax
    call vbe_read
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    imul rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_pitch]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L80
    lea rax, [rip + fb_pitch]
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    imul rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L81
.L80:
.L81:
    lea rax, [rip + fb_base]
    push rax
    xor eax, eax
    call pci_find_framebuffer
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_base]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L82
    mov rax, 0
    leave
    ret
    jmp .L83
.L82:
.L83:
    lea rax, [rip + fb_ok]
    push rax
    mov rax, 1
    pop rcx
    mov [rcx], rax
    mov rax, 1
    leave
    ret
    leave
    ret
rgb:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 255
    mov rcx, rax
    pop rax
    and rax, rcx
    push rax
    mov rax, 65536
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 255
    mov rcx, rax
    pop rax
    and rax, rcx
    push rax
    mov rax, 256
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 255
    mov rcx, rax
    pop rax
    and rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    leave
    ret
    leave
    ret
fb_pixel:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    lea rax, [rip + fb_ok]
    mov rax, [rax]
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L84
    leave
    ret
    jmp .L85
.L84:
.L85:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jnz .L92
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jnz .L92
    mov rax, 0
    jmp .L93
.L92:
    mov rax, 1
.L93:
    test rax, rax
    jnz .L90
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setge al
    movzx rax, al
    test rax, rax
    jnz .L90
    mov rax, 0
    jmp .L91
.L90:
    mov rax, 1
.L91:
    test rax, rax
    jnz .L88
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_height]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setge al
    movzx rax, al
    test rax, rax
    jnz .L88
    mov rax, 0
    jmp .L89
.L88:
    mov rax, 1
.L89:
    test rax, rax
    jz .L86
    leave
    ret
    jmp .L87
.L86:
.L87:
    lea rax, [rip + fb_base]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_pitch]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call mmio_write32
    leave
    ret
fb_get:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    lea rax, [rip + fb_ok]
    mov rax, [rax]
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L94
    mov rax, 0
    leave
    ret
    jmp .L95
.L94:
.L95:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jnz .L102
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jnz .L102
    mov rax, 0
    jmp .L103
.L102:
    mov rax, 1
.L103:
    test rax, rax
    jnz .L100
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setge al
    movzx rax, al
    test rax, rax
    jnz .L100
    mov rax, 0
    jmp .L101
.L100:
    mov rax, 1
.L101:
    test rax, rax
    jnz .L98
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_height]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setge al
    movzx rax, al
    test rax, rax
    jnz .L98
    mov rax, 0
    jmp .L99
.L98:
    mov rax, 1
.L99:
    test rax, rax
    jz .L96
    mov rax, 0
    leave
    ret
    jmp .L97
.L96:
.L97:
    lea rax, [rip + fb_base]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_pitch]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    pop rdi
    xor eax, eax
    call mmio_read32
    leave
    ret
    leave
    ret
fb_fill:
    push rbp
    mov rbp, rsp
    sub rsp, 64
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    mov [rbp - 32], rcx
    mov [rbp - 40], r8
    lea rax, [rip + fb_ok]
    mov rax, [rax]
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L104
    leave
    ret
    jmp .L105
.L104:
.L105:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L106
    lea rax, [rbp - 24]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    jmp .L107
.L106:
.L107:
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L108
    lea rax, [rbp - 32]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 16]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    jmp .L109
.L108:
.L109:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setg al
    movzx rax, al
    test rax, rax
    jz .L110
    lea rax, [rbp - 24]
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L111
.L110:
.L111:
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + fb_height]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setg al
    movzx rax, al
    test rax, rax
    jz .L112
    lea rax, [rbp - 32]
    push rax
    lea rax, [rip + fb_height]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L113
.L112:
.L113:
    lea rax, [rbp - 48]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L114:
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L115
    lea rax, [rbp - 56]
    push rax
    lea rax, [rip + fb_base]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + fb_pitch]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 64]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L116:
    lea rax, [rbp - 64]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L117
    lea rax, [rbp - 56]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 64]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call mmio_write32
    lea rax, [rbp - 64]
    push rax
    lea rax, [rbp - 64]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L116
.L117:
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L114
.L115:
    leave
    ret
fb_clear:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
    mov rax, 0
    push rax
    mov rax, 0
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_height]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    leave
    ret
fb_rect:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    mov [rbp - 32], rcx
    mov [rbp - 40], r8
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 1
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 1
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 1
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 1
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    leave
    ret
fb_line:
    push rbp
    mov rbp, rsp
    sub rsp, 96
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    mov [rbp - 32], rcx
    mov [rbp - 40], r8
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L118
    lea rax, [rbp - 48]
    push rax
    mov rax, 0
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L119
.L118:
.L119:
    lea rax, [rbp - 56]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L120
    lea rax, [rbp - 56]
    push rax
    mov rax, 0
    push rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L121
.L120:
.L121:
    lea rax, [rbp - 64]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L122
    mov rax, 1
    jmp .L123
.L122:
    mov rax, 1
    neg rax
.L123:
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 72]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L124
    mov rax, 1
    jmp .L125
.L124:
    mov rax, 1
    neg rax
.L125:
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 80]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
.L126:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L131
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L131
    mov rax, 1
    jmp .L132
.L131:
    mov rax, 0
.L132:
    test rax, rax
    jz .L129
    leave
    ret
    jmp .L130
.L129:
.L130:
    lea rax, [rbp - 88]
    push rax
    lea rax, [rbp - 80]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    imul rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 88]
    mov rax, [rax]
    push rax
    mov rax, 0
    push rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setg al
    movzx rax, al
    test rax, rax
    jz .L133
    lea rax, [rbp - 80]
    push rax
    lea rax, [rbp - 80]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 64]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L134
.L133:
.L134:
    lea rax, [rbp - 88]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L135
    lea rax, [rbp - 80]
    push rax
    lea rax, [rbp - 80]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 16]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 72]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L136
.L135:
.L136:
.L127:
    jmp .L126
.L128:
    leave
    ret
fb_circle:
    push rbp
    mov rbp, rsp
    sub rsp, 64
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    mov [rbp - 32], rcx
    lea rax, [rbp - 40]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 48]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 56]
    push rax
    mov rax, 1
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
.L137:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setge al
    movzx rax, al
    test rax, rax
    jz .L138
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L139
    lea rax, [rbp - 56]
    push rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    push rax
    mov rax, 2
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L140
.L139:
    lea rax, [rbp - 40]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 56]
    push rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    push rax
    mov rax, 2
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
.L140:
    jmp .L137
.L138:
    leave
    ret
fb_cell_w:
    push rbp
    mov rbp, rsp
    mov rax, 8
    push rax
    lea rax, [rip + fb_scale]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    leave
    ret
    leave
    ret
fb_cell_h:
    push rbp
    mov rbp, rsp
    mov rax, 8
    push rax
    lea rax, [rip + fb_scale]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    lea rax, [rip + fb_lead]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    leave
    ret
    leave
    ret
fb_cols:
    push rbp
    mov rbp, rsp
    lea rax, [rip + fb_win_w]
    mov rax, [rax]
    push rax
    xor eax, eax
    call fb_cell_w
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    leave
    ret
    leave
    ret
fb_rows:
    push rbp
    mov rbp, rsp
    lea rax, [rip + fb_win_h]
    mov rax, [rax]
    push rax
    xor eax, eax
    call fb_cell_h
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    leave
    ret
    leave
    ret
fb_glyph:
    push rbp
    mov rbp, rsp
    sub rsp, 80
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    mov [rbp - 32], rcx
    mov [rbp - 40], r8
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 32
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jnz .L143
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 126
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setg al
    movzx rax, al
    test rax, rax
    jnz .L143
    mov rax, 0
    jmp .L144
.L143:
    mov rax, 1
.L144:
    test rax, rax
    jz .L141
    lea rax, [rbp - 24]
    push rax
    mov rax, 63
    pop rcx
    mov [rcx], rax
    jmp .L142
.L141:
.L142:
    lea rax, [rbp - 56]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 32
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    imul rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 48]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L145:
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L146
    lea rax, [rbp - 64]
    push rax
    lea rax, [rip + g_font]
    push rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    movsx rax, byte ptr [rax]
    push rax
    mov rax, 255
    mov rcx, rax
    pop rax
    and rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 72]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L147:
    lea rax, [rbp - 72]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L148
    lea rax, [rbp - 80]
    push rax
    lea rax, [rbp - 64]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 72]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sar rax, cl
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    and rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 80]
    mov rax, [rax]
    test rax, rax
    jz .L149
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 72]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_scale]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_scale]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + fb_scale]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_scale]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    jmp .L150
.L149:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setge al
    movzx rax, al
    test rax, rax
    jz .L151
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 72]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_scale]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_scale]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + fb_scale]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_scale]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    jmp .L152
.L151:
.L152:
.L150:
    lea rax, [rbp - 72]
    push rax
    lea rax, [rbp - 72]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L147
.L148:
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L145
.L146:
    leave
    ret
fb_scroll:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    lea rax, [rbp - 8]
    push rax
    xor eax, eax
    call fb_cell_h
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 24]
    push rax
    xor eax, eax
    call fb_rows
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 16]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L153:
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L154
    lea rax, [rbp - 40]
    push rax
    lea rax, [rip + fb_base]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_win_y]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + fb_pitch]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + fb_win_x]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 32]
    push rax
    lea rax, [rip + fb_base]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_win_y]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + fb_pitch]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + fb_win_x]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 48]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L155:
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_win_w]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L156
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    pop rdi
    xor eax, eax
    call mmio_read32
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call mmio_write32
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L155
.L156:
    lea rax, [rbp - 16]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L153
.L154:
    lea rax, [rip + fb_win_x]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_win_y]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rip + fb_win_w]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_bg]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    leave
    ret
fb_putc:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
    lea rax, [rip + fb_ok]
    mov rax, [rax]
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L157
    leave
    ret
    jmp .L158
.L157:
.L158:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 10
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L159
    lea rax, [rip + fb_cx]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_cy]
    push rax
    lea rax, [rip + fb_cy]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L160
.L159:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 13
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L161
    lea rax, [rip + fb_cx]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    jmp .L162
.L161:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L163
    lea rax, [rip + fb_cx]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setg al
    movzx rax, al
    test rax, rax
    jz .L165
    lea rax, [rip + fb_cx]
    push rax
    lea rax, [rip + fb_cx]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_win_x]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_cx]
    mov rax, [rax]
    push rax
    xor eax, eax
    call fb_cell_w
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + fb_win_y]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_cy]
    mov rax, [rax]
    push rax
    xor eax, eax
    call fb_cell_h
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 32
    push rax
    lea rax, [rip + fb_fg]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_bg]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_glyph
    jmp .L166
.L165:
.L166:
    jmp .L164
.L163:
    lea rax, [rip + fb_win_x]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_cx]
    mov rax, [rax]
    push rax
    xor eax, eax
    call fb_cell_w
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + fb_win_y]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_cy]
    mov rax, [rax]
    push rax
    xor eax, eax
    call fb_cell_h
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_fg]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_bg]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_glyph
    lea rax, [rip + fb_cx]
    push rax
    lea rax, [rip + fb_cx]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_cx]
    mov rax, [rax]
    push rax
    xor eax, eax
    call fb_cols
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setge al
    movzx rax, al
    test rax, rax
    jz .L167
    lea rax, [rip + fb_cx]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_cy]
    push rax
    lea rax, [rip + fb_cy]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L168
.L167:
.L168:
.L164:
.L162:
.L160:
.L169:
    lea rax, [rip + fb_cy]
    mov rax, [rax]
    push rax
    xor eax, eax
    call fb_rows
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setge al
    movzx rax, al
    test rax, rax
    jz .L170
    xor eax, eax
    call fb_scroll
    lea rax, [rip + fb_cy]
    push rax
    lea rax, [rip + fb_cy]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L169
.L170:
    leave
    ret
fb_puts:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
.L171:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    test rax, rax
    jz .L172
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    pop rdi
    xor eax, eax
    call fb_putc
    lea rax, [rbp - 8]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L171
.L172:
    leave
    ret
fb_text:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    mov [rbp - 32], rcx
    mov [rbp - 40], r8
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    pop rcx
    mov [rcx], rax
.L173:
    lea rax, [rbp - 24]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    test rax, rax
    jz .L174
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_glyph
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    mov rax, 8
    push rax
    lea rax, [rip + fb_scale]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 24]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L173
.L174:
    leave
    ret
fb_console_at:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    mov [rbp - 32], rcx
    lea rax, [rip + fb_win_x]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_win_y]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_win_w]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_win_h]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_cx]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_cy]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    leave
    ret
fb_console_init:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    lea rax, [rip + fb_scale]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_lead]
    push rax
    mov rax, 2
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_fg]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    pop rcx
    mov [rcx], rax
    lea rax, [rip + fb_bg]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    pop rcx
    mov [rcx], rax
    mov rax, 0
    push rax
    mov rax, 0
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_height]
    mov rax, [rax]
    push rax
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_console_at
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    pop rdi
    xor eax, eax
    call fb_clear
    leave
    ret
draw_gradient:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    mov [rbp - 32], rcx
    lea rax, [rbp - 40]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L175:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L176
    lea rax, [rbp - 48]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L177:
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L178
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    mov rax, 255
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 255
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    push rax
    mov rax, 160
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
    lea rax, [rbp - 48]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L177
.L178:
    lea rax, [rbp - 40]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L175
.L176:
    leave
    ret
draw_bars:
    push rbp
    mov rbp, rsp
    sub rsp, 64
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
    mov [rbp - 24], rdx
    mov [rbp - 32], rcx
    lea rax, [rbp - 48]
    push rax
    mov rax, 8
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 40]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L179:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L180
    lea rax, [rbp - 56]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L181
    lea rax, [rbp - 56]
    push rax
    mov rax, 255
    push rax
    mov rax, 255
    push rax
    mov rax, 255
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    pop rcx
    mov [rcx], rax
    jmp .L182
.L181:
.L182:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L183
    lea rax, [rbp - 56]
    push rax
    mov rax, 255
    push rax
    mov rax, 255
    push rax
    mov rax, 0
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    pop rcx
    mov [rcx], rax
    jmp .L184
.L183:
.L184:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L185
    lea rax, [rbp - 56]
    push rax
    mov rax, 0
    push rax
    mov rax, 255
    push rax
    mov rax, 255
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    pop rcx
    mov [rcx], rax
    jmp .L186
.L185:
.L186:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 3
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L187
    lea rax, [rbp - 56]
    push rax
    mov rax, 0
    push rax
    mov rax, 255
    push rax
    mov rax, 0
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    pop rcx
    mov [rcx], rax
    jmp .L188
.L187:
.L188:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L189
    lea rax, [rbp - 56]
    push rax
    mov rax, 255
    push rax
    mov rax, 0
    push rax
    mov rax, 255
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    pop rcx
    mov [rcx], rax
    jmp .L190
.L189:
.L190:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 5
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L191
    lea rax, [rbp - 56]
    push rax
    mov rax, 255
    push rax
    mov rax, 0
    push rax
    mov rax, 0
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    pop rcx
    mov [rcx], rax
    jmp .L192
.L191:
.L192:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 6
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L193
    lea rax, [rbp - 56]
    push rax
    mov rax, 0
    push rax
    mov rax, 0
    push rax
    mov rax, 255
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    pop rcx
    mov [rcx], rax
    jmp .L194
.L193:
.L194:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 7
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L195
    lea rax, [rbp - 56]
    push rax
    mov rax, 40
    push rax
    mov rax, 40
    push rax
    mov rax, 40
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    pop rcx
    mov [rcx], rax
    jmp .L196
.L195:
.L196:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 48]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 56]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    lea rax, [rbp - 40]
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L179
.L180:
    leave
    ret
main:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    xor eax, eax
    call kernel_init
    .section .rodata
.LC197: .string "nano-os graphics bring-up\n"
    .section .text
    lea rax, [rip + .LC197]
    push rax
    pop rdi
    xor eax, eax
    call puts
    lea rax, [rbp - 8]
    push rax
    mov rax, 1024
    push rax
    mov rax, 768
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call fb_init
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L198
    .section .rodata
.LC200: .string "FB: no Bochs VBE adapter found, staying in text mode\n"
    .section .text
    lea rax, [rip + .LC200]
    push rax
    pop rdi
    xor eax, eax
    call puts
.L201:
.L202:
    jmp .L201
.L203:
    jmp .L199
.L198:
.L199:
    .section .rodata
.LC204: .string "FB: %dx%d at %d bpp, pitch %d\n"
    .section .text
    lea rax, [rip + .LC204]
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_height]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_bpp]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_pitch]
    mov rax, [rax]
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call printf
    .section .rodata
.LC205: .string "FB: base 0x%x\n"
    .section .text
    lea rax, [rip + .LC205]
    push rax
    lea rax, [rip + fb_base]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call printf
    mov rax, 16
    push rax
    mov rax, 18
    push rax
    mov rax, 28
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    pop rdi
    xor eax, eax
    call fb_clear
    mov rax, 0
    push rax
    mov rax, 0
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    push rax
    lea rax, [rip + fb_height]
    mov rax, [rax]
    push rax
    mov rax, 80
    push rax
    mov rax, 90
    push rax
    mov rax, 120
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_rect
    mov rax, 2
    push rax
    mov rax, 2
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rip + fb_height]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 50
    push rax
    mov rax, 56
    push rax
    mov rax, 80
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_rect
    mov rax, 40
    push rax
    mov rax, 40
    push rax
    mov rax, 944
    push rax
    mov rax, 120
    push rax
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call draw_bars
    mov rax, 40
    push rax
    mov rax, 190
    push rax
    mov rax, 944
    push rax
    mov rax, 110
    push rax
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call draw_gradient
    lea rax, [rbp - 16]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L206:
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 16
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setle al
    movzx rax, al
    test rax, rax
    jz .L207
    mov rax, 512
    push rax
    mov rax, 470
    push rax
    mov rax, 40
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 59
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 720
    push rax
    mov rax, 90
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 10
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 200
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 255
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 12
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_line
    lea rax, [rbp - 16]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L206
.L207:
    lea rax, [rbp - 16]
    push rax
    mov rax, 1
    pop rcx
    mov [rcx], rax
.L208:
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 9
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setle al
    movzx rax, al
    test rax, rax
    jz .L209
    mov rax, 512
    push rax
    mov rax, 580
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 12
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    mov rax, 255
    push rax
    mov rax, 200
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 15
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 60
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 20
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_circle
    lea rax, [rbp - 16]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L208
.L209:
    lea rax, [rip + fb_scale]
    push rax
    mov rax, 2
    pop rcx
    mov [rcx], rax
    mov rax, 40
    push rax
    mov rax, 330
    push rax
    .section .rodata
.LC210: .string "nano-os  1024x768x32  linear framebuffer"
    .section .text
    lea rax, [rip + .LC210]
    push rax
    mov rax, 230
    push rax
    mov rax, 235
    push rax
    mov rax, 255
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    mov rax, 1
    neg rax
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_text
    lea rax, [rip + fb_scale]
    push rax
    mov rax, 1
    pop rcx
    mov [rcx], rax
    mov rax, 40
    push rax
    mov rax, 356
    push rax
    .section .rodata
.LC211: .string "mode set through the Bochs VBE registers at 0x1CE/0x1CF;"
    .section .text
    lea rax, [rip + .LC211]
    push rax
    mov rax, 150
    push rax
    mov rax, 160
    push rax
    mov rax, 190
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    mov rax, 1
    neg rax
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_text
    mov rax, 40
    push rax
    mov rax, 368
    push rax
    .section .rodata
.LC212: .string "base address read from PCI config space via 0xCF8/0xCFC."
    .section .text
    lea rax, [rip + .LC212]
    push rax
    mov rax, 150
    push rax
    mov rax, 160
    push rax
    mov rax, 190
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    mov rax, 1
    neg rax
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_text
    mov rax, 40
    push rax
    mov rax, 384
    push rax
    .section .rodata
.LC213: .string "ABCDEFGHIJKLMNOPQRSTUVWXYZ  abcdefghijklmnopqrstuvwxyz"
    .section .text
    lea rax, [rip + .LC213]
    push rax
    mov rax, 200
    push rax
    mov rax, 200
    push rax
    mov rax, 120
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    mov rax, 1
    neg rax
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_text
    mov rax, 40
    push rax
    mov rax, 396
    push rax
    .section .rodata
.LC214: .string "0123456789  !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
    .section .text
    lea rax, [rip + .LC214]
    push rax
    mov rax, 200
    push rax
    mov rax, 200
    push rax
    mov rax, 120
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    mov rax, 1
    neg rax
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_text
    mov rax, 40
    push rax
    mov rax, 412
    push rax
    .section .rodata
.LC215: .string "every pixel here was written by code this compiler built."
    .section .text
    lea rax, [rip + .LC215]
    push rax
    mov rax, 120
    push rax
    mov rax, 200
    push rax
    mov rax, 160
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    mov rax, 1
    neg rax
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_text
    mov rax, 5
    push rax
    mov rax, 5
    push rax
    mov rax, 1
    push rax
    mov rax, 2
    push rax
    mov rax, 3
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call rgb
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
    .section .rodata
.LC216: .string "FB: readback 0x%x (want 0x10203)\n"
    .section .text
    lea rax, [rip + .LC216]
    push rax
    mov rax, 5
    push rax
    mov rax, 5
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call fb_get
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call printf
    .section .rodata
.LC217: .string "FB: drawing complete\n"
    .section .text
    lea rax, [rip + .LC217]
    push rax
    pop rdi
    xor eax, eax
    call puts
.L218:
.L219:
    jmp .L218
.L220:
    mov rax, 0
    leave
    ret
    leave
    ret
    .section .data
    .align 8
fb_win_h: .zero 8
fb_win_w: .zero 8
fb_win_y: .zero 8
fb_win_x: .zero 8
fb_bg: .zero 8
fb_fg: .zero 8
fb_cy: .zero 8
fb_cx: .zero 8
fb_lead: .zero 8
fb_scale: .zero 8
g_font:
    .byte 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 0, 8, 0, 20, 20, 20, 0, 0, 0, 0, 0, 20, 20, 62, 20, 62, 20, 20, 0
    .byte 8, 60, 10, 28, 80, 60, 8, 0, 70, 38, 16, 8, 4, 50, 49, 0, 12, 18, 18, 12, 42, 18, 44, 0, 8, 8, 8, 0, 0, 0, 0, 0
    .byte 16, 8, 4, 4, 4, 8, 16, 0, 4, 8, 16, 16, 16, 8, 4, 0, 0, 8, 42, 28, 42, 8, 0, 0, 0, 8, 8, 62, 8, 8, 0, 0
    .byte 0, 0, 0, 0, 0, 24, 8, 4, 0, 0, 0, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 0, 64, 32, 16, 8, 4, 2, 1, 0
    .byte 28, 34, 50, 42, 38, 34, 28, 0, 8, 12, 8, 8, 8, 8, 28, 0, 28, 34, 32, 16, 8, 4, 62, 0, 62, 16, 8, 16, 32, 34, 28, 0
    .byte 16, 24, 20, 18, 62, 16, 16, 0, 62, 2, 30, 32, 32, 34, 28, 0, 24, 4, 2, 30, 34, 34, 28, 0, 62, 32, 16, 8, 4, 4, 4, 0
    .byte 28, 34, 34, 28, 34, 34, 28, 0, 28, 34, 34, 60, 32, 16, 12, 0, 0, 24, 24, 0, 24, 24, 0, 0, 0, 24, 24, 0, 24, 8, 4, 0
    .byte 16, 8, 4, 2, 4, 8, 16, 0, 0, 0, 62, 0, 62, 0, 0, 0, 2, 4, 8, 16, 8, 4, 2, 0, 28, 34, 32, 16, 8, 0, 8, 0
    .byte 28, 34, 58, 42, 58, 2, 60, 0, 28, 34, 34, 62, 34, 34, 34, 0, 30, 34, 34, 30, 34, 34, 30, 0, 28, 34, 2, 2, 2, 34, 28, 0
    .byte 30, 34, 34, 34, 34, 34, 30, 0, 62, 2, 2, 30, 2, 2, 62, 0, 62, 2, 2, 30, 2, 2, 2, 0, 28, 34, 2, 50, 34, 34, 60, 0
    .byte 34, 34, 34, 62, 34, 34, 34, 0, 28, 8, 8, 8, 8, 8, 28, 0, 48, 32, 32, 32, 34, 34, 28, 0, 34, 18, 10, 6, 10, 18, 34, 0
    .byte 2, 2, 2, 2, 2, 2, 62, 0, 34, 54, 42, 42, 34, 34, 34, 0, 34, 38, 42, 42, 50, 34, 34, 0, 28, 34, 34, 34, 34, 34, 28, 0
    .byte 30, 34, 34, 30, 2, 2, 2, 0, 28, 34, 34, 34, 42, 18, 44, 0, 30, 34, 34, 30, 10, 18, 34, 0, 60, 2, 2, 28, 32, 32, 30, 0
    .byte 62, 8, 8, 8, 8, 8, 8, 0, 34, 34, 34, 34, 34, 34, 28, 0, 34, 34, 34, 34, 34, 20, 8, 0, 34, 34, 34, 42, 42, 54, 34, 0
    .byte 34, 34, 20, 8, 20, 34, 34, 0, 34, 34, 20, 8, 8, 8, 8, 0, 62, 32, 16, 8, 4, 2, 62, 0, 28, 4, 4, 4, 4, 4, 28, 0
    .byte 1, 2, 4, 8, 16, 32, 64, 0, 28, 16, 16, 16, 16, 16, 28, 0, 8, 20, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62
    .byte 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 28, 32, 60, 34, 60, 0, 2, 2, 30, 34, 34, 34, 30, 0, 0, 0, 60, 2, 2, 2, 60, 0
    .byte 32, 32, 60, 34, 34, 34, 60, 0, 0, 0, 28, 34, 62, 2, 60, 0, 24, 36, 4, 30, 4, 4, 4, 0, 0, 0, 60, 34, 34, 60, 32, 28
    .byte 2, 2, 30, 34, 34, 34, 34, 0, 8, 0, 12, 8, 8, 8, 28, 0, 16, 0, 24, 16, 16, 16, 18, 12, 2, 2, 18, 10, 6, 10, 18, 0
    .byte 12, 8, 8, 8, 8, 8, 28, 0, 0, 0, 22, 42, 42, 42, 34, 0, 0, 0, 30, 34, 34, 34, 34, 0, 0, 0, 28, 34, 34, 34, 28, 0
    .byte 0, 0, 30, 34, 34, 30, 2, 2, 0, 0, 60, 34, 34, 60, 32, 32, 0, 0, 58, 6, 2, 2, 2, 0, 0, 0, 60, 2, 28, 32, 30, 0
    .byte 4, 4, 30, 4, 4, 36, 24, 0, 0, 0, 34, 34, 34, 50, 44, 0, 0, 0, 34, 34, 34, 20, 8, 0, 0, 0, 34, 42, 42, 42, 20, 0
    .byte 0, 0, 34, 20, 8, 20, 34, 0, 0, 0, 34, 34, 34, 60, 32, 28, 0, 0, 62, 16, 8, 4, 62, 0, 48, 8, 8, 4, 8, 8, 48, 0
    .byte 8, 8, 8, 8, 8, 8, 8, 0, 12, 16, 16, 32, 16, 16, 12, 0, 0, 0, 36, 90, 18, 0, 0, 0
fb_ok: .zero 8
fb_bpp: .zero 8
fb_pitch: .zero 8
fb_height: .zero 8
fb_width: .zero 8
fb_base: .zero 8
g_keymap: .zero 128
g_have_fb: .zero 8
vga_col: .zero 8
vga_row: .zero 8
