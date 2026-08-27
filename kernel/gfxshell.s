.intel_syntax noprefix
    .section .text
    .globl main
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
.L0:
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
    jz .L1
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
    jz .L4
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
    jz .L4
    mov rax, 1
    jmp .L5
.L4:
    mov rax, 0
.L5:
    test rax, rax
    jz .L2
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
    jz .L6
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
    jz .L8
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
    jmp .L9
.L8:
.L9:
    jmp .L7
.L6:
.L7:
    jmp .L3
.L2:
.L3:
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
    jmp .L0
.L1:
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
    jnz .L12
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
    jnz .L12
    mov rax, 0
    jmp .L13
.L12:
    mov rax, 1
.L13:
    test rax, rax
    jz .L10
    mov rax, 0
    leave
    ret
    jmp .L11
.L10:
.L11:
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
    jnz .L18
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
    jnz .L18
    mov rax, 0
    jmp .L19
.L18:
    mov rax, 1
.L19:
    test rax, rax
    jnz .L16
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
    jnz .L16
    mov rax, 0
    jmp .L17
.L16:
    mov rax, 1
.L17:
    test rax, rax
    jz .L14
    mov rax, 0
    leave
    ret
    jmp .L15
.L14:
.L15:
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
    jz .L20
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
    jmp .L21
.L20:
.L21:
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
    jz .L22
    mov rax, 0
    leave
    ret
    jmp .L23
.L22:
.L23:
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
    jz .L24
    leave
    ret
    jmp .L25
.L24:
.L25:
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
    jnz .L32
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
    jnz .L32
    mov rax, 0
    jmp .L33
.L32:
    mov rax, 1
.L33:
    test rax, rax
    jnz .L30
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
    jnz .L30
    mov rax, 0
    jmp .L31
.L30:
    mov rax, 1
.L31:
    test rax, rax
    jnz .L28
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
    jnz .L28
    mov rax, 0
    jmp .L29
.L28:
    mov rax, 1
.L29:
    test rax, rax
    jz .L26
    leave
    ret
    jmp .L27
.L26:
.L27:
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
    jz .L34
    mov rax, 0
    leave
    ret
    jmp .L35
.L34:
.L35:
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
    jnz .L42
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
    jnz .L42
    mov rax, 0
    jmp .L43
.L42:
    mov rax, 1
.L43:
    test rax, rax
    jnz .L40
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
    jnz .L40
    mov rax, 0
    jmp .L41
.L40:
    mov rax, 1
.L41:
    test rax, rax
    jnz .L38
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
    jnz .L38
    mov rax, 0
    jmp .L39
.L38:
    mov rax, 1
.L39:
    test rax, rax
    jz .L36
    mov rax, 0
    leave
    ret
    jmp .L37
.L36:
.L37:
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
    jz .L44
    leave
    ret
    jmp .L45
.L44:
.L45:
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
    jz .L46
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
    jmp .L47
.L46:
.L47:
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
    jz .L48
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
    jmp .L49
.L48:
.L49:
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
    jz .L50
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
    jmp .L51
.L50:
.L51:
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
    jz .L52
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
    jmp .L53
.L52:
.L53:
    lea rax, [rbp - 48]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L54:
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
    jz .L55
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
.L56:
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
    jz .L57
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
    jmp .L56
.L57:
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
    jmp .L54
.L55:
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
    jz .L58
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
    jmp .L59
.L58:
.L59:
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
    jz .L60
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
    jmp .L61
.L60:
.L61:
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
    jz .L62
    mov rax, 1
    jmp .L63
.L62:
    mov rax, 1
    neg rax
.L63:
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
    jz .L64
    mov rax, 1
    jmp .L65
.L64:
    mov rax, 1
    neg rax
.L65:
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
.L66:
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
    jz .L71
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
    jz .L71
    mov rax, 1
    jmp .L72
.L71:
    mov rax, 0
.L72:
    test rax, rax
    jz .L69
    leave
    ret
    jmp .L70
.L69:
.L70:
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
    jz .L73
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
    jmp .L74
.L73:
.L74:
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
    jz .L75
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
    jmp .L76
.L75:
.L76:
.L67:
    jmp .L66
.L68:
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
.L77:
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
    jz .L78
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
    jz .L79
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
    jmp .L80
.L79:
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
.L80:
    jmp .L77
.L78:
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
    jnz .L83
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
    jnz .L83
    mov rax, 0
    jmp .L84
.L83:
    mov rax, 1
.L84:
    test rax, rax
    jz .L81
    lea rax, [rbp - 24]
    push rax
    mov rax, 63
    pop rcx
    mov [rcx], rax
    jmp .L82
.L81:
.L82:
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
.L85:
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
    jz .L86
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
.L87:
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
    jz .L88
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
    jz .L89
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
    jmp .L90
.L89:
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
    jz .L91
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
    jmp .L92
.L91:
.L92:
.L90:
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
    jmp .L87
.L88:
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
    jmp .L85
.L86:
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
.L93:
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
    jz .L94
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
.L95:
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
    jz .L96
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
    jmp .L95
.L96:
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
    jmp .L93
.L94:
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
    jz .L97
    leave
    ret
    jmp .L98
.L97:
.L98:
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
    jz .L99
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
    jmp .L100
.L99:
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
    jz .L101
    lea rax, [rip + fb_cx]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    jmp .L102
.L101:
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
    jz .L103
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
    jz .L105
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
    jmp .L106
.L105:
.L106:
    jmp .L104
.L103:
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
    jz .L107
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
    jmp .L108
.L107:
.L108:
.L104:
.L102:
.L100:
.L109:
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
    jz .L110
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
    jmp .L109
.L110:
    leave
    ret
fb_puts:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
.L111:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    test rax, rax
    jz .L112
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
    jmp .L111
.L112:
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
.L113:
    lea rax, [rbp - 24]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    test rax, rax
    jz .L114
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
    jmp .L113
.L114:
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
    jz .L115
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
    jmp .L116
.L115:
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
    jz .L117
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
    jmp .L118
.L117:
.L118:
.L116:
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
    jz .L119
    lea rax, [rip + vga_row]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    jmp .L120
.L119:
.L120:
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
.L121:
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
    jz .L122
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
    jmp .L121
.L122:
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
.L123:
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
    jz .L124
    jmp .L123
.L124:
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
    jz .L125
    mov rax, 13
    push rax
    pop rdi
    xor eax, eax
    call serial_put
    jmp .L126
.L125:
.L126:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    pop rdi
    xor eax, eax
    call serial_put
    lea rax, [rip + g_have_fb]
    mov rax, [rax]
    test rax, rax
    jz .L127
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    pop rdi
    xor eax, eax
    call fb_putc
    jmp .L128
.L127:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    pop rdi
    xor eax, eax
    call vga_put
.L128:
    leave
    ret
puts:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
.L129:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    test rax, rax
    jz .L130
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
    jmp .L129
.L130:
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
    jz .L131
    mov rax, 48
    push rax
    pop rdi
    xor eax, eax
    call putc
    leave
    ret
    jmp .L132
.L131:
.L132:
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
    jz .L133
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
    jmp .L134
.L133:
.L134:
    lea rax, [rbp - 40]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L135:
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
    jz .L136
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
    jmp .L135
.L136:
.L137:
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
    jz .L138
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
    jmp .L137
.L138:
    leave
    ret
strcmp:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
.L139:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    test rax, rax
    jz .L141
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
    jz .L141
    mov rax, 1
    jmp .L142
.L141:
    mov rax, 0
.L142:
    test rax, rax
    jz .L140
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
    jmp .L139
.L140:
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
.LC143: .string "0123456789abcdef"
    .section .text
    lea rax, [rip + .LC143]
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
    jz .L144
    mov rax, 48
    push rax
    pop rdi
    xor eax, eax
    call putc
    leave
    ret
    jmp .L145
.L144:
.L145:
    lea rax, [rbp - 56]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L146:
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
    jz .L147
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
    jmp .L146
.L147:
.L148:
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
    jz .L149
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
    jmp .L148
.L149:
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
.L150:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    test rax, rax
    jz .L151
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
    jz .L152
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
    jz .L154
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
    jz .L156
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
    jmp .L157
.L156:
.L157:
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 10
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call _put_uint
    jmp .L155
.L154:
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
    jz .L158
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
    jmp .L159
.L158:
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
    jz .L160
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
    jmp .L161
.L160:
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
    jz .L162
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
    jmp .L163
.L162:
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
    jz .L164
    mov rax, 37
    push rax
    pop rdi
    xor eax, eax
    call putc
    jmp .L165
.L164:
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
.L165:
.L163:
.L161:
.L159:
.L155:
    jmp .L153
.L152:
    lea rax, [rbp - 8]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    push rax
    pop rdi
    xor eax, eax
    call putc
.L153:
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
    jmp .L150
.L151:
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
.L166:
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
    jz .L167
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
    jmp .L166
.L167:
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
.L168:
.L171:
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
    jz .L172
    jmp .L171
.L172:
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
    jz .L173
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
    jz .L175
    lea rax, [rbp - 16]
    movsx rax, byte ptr [rax]
    leave
    ret
    jmp .L176
.L175:
.L176:
    jmp .L174
.L173:
.L174:
.L169:
    jmp .L168
.L170:
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
chrome:
    push rbp
    mov rbp, rsp
    mov rax, 856343
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
    mov rax, 26
    push rax
    mov rax, 1448738
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    mov rax, 0
    push rax
    mov rax, 26
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    push rax
    mov rax, 1
    push rax
    mov rax, 3159613
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    lea rax, [rip + fb_scale]
    push rax
    mov rax, 2
    pop rcx
    mov [rcx], rax
    mov rax, 12
    push rax
    mov rax, 5
    push rax
    .section .rodata
.LC177: .string "nano-os"
    .section .text
    lea rax, [rip + .LC177]
    push rax
    mov rax, 5809919
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
    mov rax, 130
    push rax
    mov rax, 10
    push rax
    .section .rodata
.LC178: .string "compiled by nano_cc, which compiled itself"
    .section .text
    lea rax, [rip + .LC178]
    push rax
    mov rax, 7239297
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
    mov rax, 2
    pop rcx
    mov [rcx], rax
    lea rax, [rip + g_panel_x]
    push rax
    mov rax, 528
    pop rcx
    mov [rcx], rax
    lea rax, [rip + g_panel_y]
    push rax
    mov rax, 44
    pop rcx
    mov [rcx], rax
    lea rax, [rip + g_panel_w]
    push rax
    lea rax, [rip + fb_width]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 16
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rip + g_panel_h]
    push rax
    lea rax, [rip + fb_height]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 16
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_h]
    mov rax, [rax]
    push rax
    mov rax, 66569
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_h]
    mov rax, [rax]
    push rax
    mov rax, 3159613
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_rect
    lea rax, [rip + fb_scale]
    push rax
    mov rax, 1
    pop rcx
    mov [rcx], rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    .section .rodata
.LC179: .string "drawing surface"
    .section .text
    lea rax, [rip + .LC179]
    push rax
    mov rax, 7239297
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
    mov rax, 2
    pop rcx
    mov [rcx], rax
    leave
    ret
panel_clear:
    push rbp
    mov rbp, rsp
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    lea rax, [rip + g_panel_h]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 66569
    push rax
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_fill
    lea rax, [rip + fb_scale]
    push rax
    mov rax, 1
    pop rcx
    mov [rcx], rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    .section .rodata
.LC180: .string "drawing surface"
    .section .text
    lea rax, [rip + .LC180]
    push rax
    mov rax, 7239297
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
    mov rax, 2
    pop rcx
    mov [rcx], rax
    leave
    ret
cmd_bars:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    xor eax, eax
    call panel_clear
    lea rax, [rbp - 16]
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    mov rax, 40
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L181:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L182
    lea rax, [rbp - 24]
    push rax
    mov rax, 0
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
    jz .L183
    lea rax, [rbp - 24]
    push rax
    mov rax, 16777215
    pop rcx
    mov [rcx], rax
    jmp .L184
.L183:
.L184:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L185
    lea rax, [rbp - 24]
    push rax
    mov rax, 16776960
    pop rcx
    mov [rcx], rax
    jmp .L186
.L185:
.L186:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L187
    lea rax, [rbp - 24]
    push rax
    mov rax, 65535
    pop rcx
    mov [rcx], rax
    jmp .L188
.L187:
.L188:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 3
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L189
    lea rax, [rbp - 24]
    push rax
    mov rax, 65280
    pop rcx
    mov [rcx], rax
    jmp .L190
.L189:
.L190:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L191
    lea rax, [rbp - 24]
    push rax
    mov rax, 16711935
    pop rcx
    mov [rcx], rax
    jmp .L192
.L191:
.L192:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 5
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L193
    lea rax, [rbp - 24]
    push rax
    mov rax, 16711680
    pop rcx
    mov [rcx], rax
    jmp .L194
.L193:
.L194:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 6
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L195
    lea rax, [rbp - 24]
    push rax
    mov rax, 255
    pop rcx
    mov [rcx], rax
    jmp .L196
.L195:
.L196:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 7
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L197
    lea rax, [rbp - 24]
    push rax
    mov rax, 2631720
    pop rcx
    mov [rcx], rax
    jmp .L198
.L197:
.L198:
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 20
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    mov rax, 40
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 120
    push rax
    lea rax, [rbp - 24]
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
    jmp .L181
.L182:
    .section .rodata
.LC199: .string "drew colour bars\n"
    .section .text
    lea rax, [rip + .LC199]
    push rax
    pop rdi
    xor eax, eax
    call puts
    leave
    ret
cmd_grad:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    xor eax, eax
    call panel_clear
    lea rax, [rbp - 16]
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    mov rax, 40
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 24]
    push rax
    mov rax, 160
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L200:
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
    jz .L201
    lea rax, [rbp - 32]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L202:
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L203
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 20
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    mov rax, 40
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
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    mov rax, 255
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    push rax
    lea rax, [rbp - 8]
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
    mov rax, 200
    push rax
    lea rax, [rbp - 8]
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
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
    lea rax, [rbp - 32]
    push rax
    lea rax, [rbp - 32]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L202
.L203:
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
    jmp .L200
.L201:
    .section .rodata
.LC204: .string "drew a gradient\n"
    .section .text
    lea rax, [rip + .LC204]
    push rax
    pop rdi
    xor eax, eax
    call puts
    leave
    ret
cmd_lines:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    xor eax, eax
    call panel_clear
    lea rax, [rbp - 16]
    push rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 24]
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    mov rax, 60
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
.L205:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 20
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setle al
    movzx rax, al
    test rax, rax
    jz .L206
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 20
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    mov rax, 40
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 20
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
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_h]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 40
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 80
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 220
    push rax
    lea rax, [rbp - 8]
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
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 6
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
    jmp .L205
.L206:
    .section .rodata
.LC207: .string "drew a line fan\n"
    .section .text
    lea rax, [rip + .LC207]
    push rax
    pop rdi
    xor eax, eax
    call puts
    leave
    ret
cmd_circles:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    xor eax, eax
    call panel_clear
    lea rax, [rbp - 16]
    push rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 24]
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_h]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    push rax
    mov rax, 1
    pop rcx
    mov [rcx], rax
.L208:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 14
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setle al
    movzx rax, al
    test rax, rax
    jz .L209
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 14
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    mov rax, 255
    push rax
    mov rax, 210
    push rax
    lea rax, [rbp - 8]
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
    mov rax, 40
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 14
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
    jmp .L208
.L209:
    .section .rodata
.LC210: .string "drew concentric circles\n"
    .section .text
    lea rax, [rip + .LC210]
    push rax
    pop rdi
    xor eax, eax
    call puts
    leave
    ret
cmd_font:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    xor eax, eax
    call panel_clear
    lea rax, [rbp - 8]
    push rax
    mov rax, 32
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 16]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 24]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L211:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 126
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setle al
    movzx rax, al
    test rax, rax
    jz .L212
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 24
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 18
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    mov rax, 40
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 24]
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
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 13226457
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
    call fb_glyph
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
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 22
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setge al
    movzx rax, al
    test rax, rax
    jz .L213
    lea rax, [rbp - 16]
    push rax
    mov rax, 0
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
    jmp .L214
.L213:
.L214:
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
    jmp .L211
.L212:
    .section .rodata
.LC215: .string "drew the whole font, 95 glyphs\n"
    .section .text
    lea rax, [rip + .LC215]
    push rax
    pop rdi
    xor eax, eax
    call puts
    leave
    ret
cmd_demo:
    push rbp
    mov rbp, rsp
    sub rsp, 48
    xor eax, eax
    call panel_clear
    lea rax, [rbp - 16]
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    mov rax, 40
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L216:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L217
    lea rax, [rbp - 32]
    push rax
    mov rax, 0
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
    jz .L218
    lea rax, [rbp - 32]
    push rax
    mov rax, 16777215
    pop rcx
    mov [rcx], rax
    jmp .L219
.L218:
.L219:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L220
    lea rax, [rbp - 32]
    push rax
    mov rax, 16776960
    pop rcx
    mov [rcx], rax
    jmp .L221
.L220:
.L221:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L222
    lea rax, [rbp - 32]
    push rax
    mov rax, 65535
    pop rcx
    mov [rcx], rax
    jmp .L223
.L222:
.L223:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 3
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L224
    lea rax, [rbp - 32]
    push rax
    mov rax, 65280
    pop rcx
    mov [rcx], rax
    jmp .L225
.L224:
.L225:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 4
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L226
    lea rax, [rbp - 32]
    push rax
    mov rax, 16711935
    pop rcx
    mov [rcx], rax
    jmp .L227
.L226:
.L227:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 5
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L228
    lea rax, [rbp - 32]
    push rax
    mov rax, 16711680
    pop rcx
    mov [rcx], rax
    jmp .L229
.L228:
.L229:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 6
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L230
    lea rax, [rbp - 32]
    push rax
    mov rax, 255
    pop rcx
    mov [rcx], rax
    jmp .L231
.L230:
.L231:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 7
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L232
    lea rax, [rbp - 32]
    push rax
    mov rax, 3158064
    pop rcx
    mov [rcx], rax
    jmp .L233
.L232:
.L233:
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 20
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    mov rax, 34
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    mov rax, 70
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
    jmp .L216
.L217:
    lea rax, [rbp - 40]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L234:
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 70
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L235
    lea rax, [rbp - 8]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L236:
    lea rax, [rbp - 8]
    mov rax, [rax]
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
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L237
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 20
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
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    mov rax, 116
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 255
    mov rcx, rax
    pop rax
    imul rax, rcx
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
    mov rax, 70
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    push rax
    mov rax, 190
    push rax
    lea rax, [rbp - 40]
    mov rax, [rax]
    push rax
    mov rax, 2
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
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_pixel
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
    jmp .L236
.L237:
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
    jmp .L234
.L235:
    lea rax, [rbp - 24]
    push rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
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
.L238:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 24
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setle al
    movzx rax, al
    test rax, rax
    jz .L239
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    mov rax, 210
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 20
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    mov rax, 40
    mov rcx, rax
    pop rax
    sub rax, rcx
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    mov rax, 24
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    mov rax, 400
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 70
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 7
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 220
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 6
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 255
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 5
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
    jmp .L238
.L239:
    lea rax, [rbp - 8]
    push rax
    mov rax, 1
    pop rcx
    mov [rcx], rax
.L240:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 12
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setle al
    movzx rax, al
    test rax, rax
    jz .L241
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    mov rax, 510
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 12
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    mov rax, 255
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 10
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 200
    push rax
    lea rax, [rbp - 8]
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
    mov rax, 60
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 16
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
    jmp .L240
.L241:
    lea rax, [rip + fb_scale]
    push rax
    mov rax, 1
    pop rcx
    mov [rcx], rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_h]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 18
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    .section .rodata
.LC242: .string "every pixel written by code this compiler built"
    .section .text
    lea rax, [rip + .LC242]
    push rax
    mov rax, 7239297
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
    mov rax, 2
    pop rcx
    mov [rcx], rax
    .section .rodata
.LC243: .string "drew bars, gradient, lines and circles\n"
    .section .text
    lea rax, [rip + .LC243]
    push rax
    pop rdi
    xor eax, eax
    call puts
    leave
    ret
cmd_fbinfo:
    push rbp
    mov rbp, rsp
    .section .rodata
.LC244: .string "resolution %dx%d at %d bpp\n"
    .section .text
    lea rax, [rip + .LC244]
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
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call printf
    .section .rodata
.LC245: .string "pitch      %d bytes per scanline\n"
    .section .text
    lea rax, [rip + .LC245]
    push rax
    lea rax, [rip + fb_pitch]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call printf
    .section .rodata
.LC246: .string "base       0x%x (from PCI BAR0)\n"
    .section .text
    lea rax, [rip + .LC246]
    push rax
    lea rax, [rip + fb_base]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call printf
    .section .rodata
.LC247: .string "console    %dx%d characters\n"
    .section .text
    lea rax, [rip + .LC247]
    push rax
    xor eax, eax
    call fb_cols
    push rax
    xor eax, eax
    call fb_rows
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call printf
    leave
    ret
cmd_pci:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    lea rax, [rbp - 16]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 8]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L248:
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
    jz .L249
    lea rax, [rbp - 24]
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
    lea rax, [rbp - 24]
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
    jz .L252
    lea rax, [rbp - 24]
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
    jz .L252
    mov rax, 1
    jmp .L253
.L252:
    mov rax, 0
.L253:
    test rax, rax
    jz .L250
    lea rax, [rbp - 32]
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
    .section .rodata
.LC254: .string "00:%d vendor %x device %x class %x\n"
    .section .text
    lea rax, [rip + .LC254]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 65535
    mov rcx, rax
    pop rax
    and rax, rcx
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    mov rax, 16
    mov rcx, rax
    pop rax
    sar rax, cl
    push rax
    mov rax, 65535
    mov rcx, rax
    pop rax
    and rax, rcx
    push rax
    lea rax, [rbp - 32]
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
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call printf
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
    jmp .L251
.L250:
.L251:
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
    jmp .L248
.L249:
    .section .rodata
.LC255: .string "%d devices on bus 0\n"
    .section .text
    lea rax, [rip + .LC255]
    push rax
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call printf
    leave
    ret
cmd_help:
    push rbp
    mov rbp, rsp
    .section .rodata
.LC256: .string "commands:\n"
    .section .text
    lea rax, [rip + .LC256]
    push rax
    pop rdi
    xor eax, eax
    call puts
    .section .rodata
.LC257: .string "  help clear ver fbinfo pci\n"
    .section .text
    lea rax, [rip + .LC257]
    push rax
    pop rdi
    xor eax, eax
    call puts
    .section .rodata
.LC258: .string "  demo bars grad lines circles font\n"
    .section .text
    lea rax, [rip + .LC258]
    push rax
    pop rdi
    xor eax, eax
    call puts
    .section .rodata
.LC259: .string "  echo <text>\n"
    .section .text
    lea rax, [rip + .LC259]
    push rax
    pop rdi
    xor eax, eax
    call puts
    leave
    ret
splash:
    push rbp
    mov rbp, rsp
    sub rsp, 32
    lea rax, [rbp - 16]
    push rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 24]
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_h]
    mov rax, [rax]
    push rax
    mov rax, 2
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
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
.L260:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 60
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L261
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 20
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_w]
    mov rax, [rax]
    push rax
    mov rax, 40
    mov rcx, rax
    pop rax
    sub rax, rcx
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    mov rax, 60
    mov rcx, rax
    pop rax
    cqo
    idiv rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_h]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 30
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 30
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 3
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 90
    push rax
    lea rax, [rbp - 8]
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
    mov rax, 200
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 2
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
    lea rax, [rbp - 8]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 3
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    jmp .L260
.L261:
    lea rax, [rbp - 8]
    push rax
    mov rax, 1
    pop rcx
    mov [rcx], rax
.L262:
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 10
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setle al
    movzx rax, al
    test rax, rax
    jz .L263
    lea rax, [rbp - 16]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 24]
    mov rax, [rax]
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 13
    mov rcx, rax
    pop rax
    imul rax, rcx
    push rax
    mov rax, 255
    push rax
    lea rax, [rbp - 8]
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
    mov rax, 180
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 10
    mov rcx, rax
    pop rax
    imul rax, rcx
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    mov rax, 90
    push rax
    lea rax, [rbp - 8]
    mov rax, [rax]
    push rax
    mov rax, 15
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
    jmp .L262
.L263:
    lea rax, [rip + fb_scale]
    push rax
    mov rax, 1
    pop rcx
    mov [rcx], rax
    lea rax, [rip + g_panel_x]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rip + g_panel_y]
    mov rax, [rax]
    push rax
    lea rax, [rip + g_panel_h]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 18
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    .section .rodata
.LC264: .string "every pixel written by code this compiler built"
    .section .text
    lea rax, [rip + .LC264]
    push rax
    mov rax, 7239297
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
    mov rax, 2
    pop rcx
    mov [rcx], rax
    leave
    ret
starts_with:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov [rbp - 8], rdi
    mov [rbp - 16], rsi
.L265:
    lea rax, [rbp - 16]
    mov rax, [rax]
    movsx rax, byte ptr [rax]
    test rax, rax
    jz .L266
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
    setne al
    movzx rax, al
    test rax, rax
    jz .L267
    mov rax, 0
    leave
    ret
    jmp .L268
.L267:
.L268:
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
    jmp .L265
.L266:
    mov rax, 1
    leave
    ret
    leave
    ret
main:
    push rbp
    mov rbp, rsp
    sub rsp, 144
    xor eax, eax
    call serial_init
    xor eax, eax
    call kbd_init
    mov rax, 1024
    push rax
    mov rax, 768
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call fb_init
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L269
    xor eax, eax
    call vga_clear
    .section .rodata
.LC271: .string "no Bochs VBE adapter; cannot start the graphics shell\n"
    .section .text
    lea rax, [rip + .LC271]
    push rax
    pop rdi
    xor eax, eax
    call puts
.L272:
.L273:
    jmp .L272
.L274:
    jmp .L270
.L269:
.L270:
    mov rax, 2
    push rax
    mov rax, 13226457
    push rax
    mov rax, 856343
    push rax
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_console_init
    xor eax, eax
    call chrome
    mov rax, 12
    push rax
    mov rax, 44
    push rax
    mov rax, 500
    push rax
    lea rax, [rip + fb_height]
    mov rax, [rax]
    push rax
    mov rax, 60
    mov rcx, rax
    pop rax
    sub rax, rcx
    push rax
    pop rcx
    pop rdx
    pop rsi
    pop rdi
    xor eax, eax
    call fb_console_at
    lea rax, [rip + g_have_fb]
    push rax
    mov rax, 1
    pop rcx
    mov [rcx], rax
    xor eax, eax
    call splash
    .section .rodata
.LC275: .string "framebuffer console up. type help.\n\n"
    .section .text
    lea rax, [rip + .LC275]
    push rax
    pop rdi
    xor eax, eax
    call puts
.L276:
    .section .rodata
.LC279: .string "> "
    .section .text
    lea rax, [rip + .LC279]
    push rax
    pop rdi
    xor eax, eax
    call puts
    lea rax, [rbp - 136]
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], rax
.L280:
    lea rax, [rbp - 144]
    push rax
    xor eax, eax
    call keyboard_getchar
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 144]
    mov rax, [rax]
    push rax
    mov rax, 10
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L283
    mov rax, 10
    push rax
    pop rdi
    xor eax, eax
    call putc
    jmp .L282
    jmp .L284
.L283:
.L284:
    lea rax, [rbp - 144]
    mov rax, [rax]
    push rax
    mov rax, 8
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L285
    lea rax, [rbp - 136]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setg al
    movzx rax, al
    test rax, rax
    jz .L287
    lea rax, [rbp - 136]
    push rax
    lea rax, [rbp - 136]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    sub rax, rcx
    pop rcx
    mov [rcx], rax
    mov rax, 8
    push rax
    pop rdi
    xor eax, eax
    call putc
    jmp .L288
.L287:
.L288:
    jmp .L286
.L285:
    lea rax, [rbp - 136]
    mov rax, [rax]
    push rax
    mov rax, 120
    mov rcx, rax
    pop rax
    cmp rax, rcx
    setl al
    movzx rax, al
    test rax, rax
    jz .L289
    lea rax, [rbp - 128]
    push rax
    lea rax, [rbp - 136]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    lea rax, [rbp - 144]
    mov rax, [rax]
    pop rcx
    mov [rcx], al
    lea rax, [rbp - 136]
    push rax
    lea rax, [rbp - 136]
    mov rax, [rax]
    push rax
    mov rax, 1
    mov rcx, rax
    pop rax
    add rax, rcx
    pop rcx
    mov [rcx], rax
    lea rax, [rbp - 144]
    mov rax, [rax]
    push rax
    pop rdi
    xor eax, eax
    call putc
    jmp .L290
.L289:
.L290:
.L286:
.L281:
    jmp .L280
.L282:
    lea rax, [rbp - 128]
    push rax
    lea rax, [rbp - 136]
    mov rax, [rax]
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    mov rax, 0
    pop rcx
    mov [rcx], al
    lea rax, [rbp - 136]
    mov rax, [rax]
    push rax
    mov rax, 0
    mov rcx, rax
    pop rax
    cmp rax, rcx
    sete al
    movzx rax, al
    test rax, rax
    jz .L291
    jmp .L292
.L291:
    lea rax, [rbp - 128]
    push rax
    .section .rodata
.LC295: .string "help"
    .section .text
    lea rax, [rip + .LC295]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call strcmp
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L293
    xor eax, eax
    call cmd_help
    jmp .L294
.L293:
    lea rax, [rbp - 128]
    push rax
    .section .rodata
.LC298: .string "clear"
    .section .text
    lea rax, [rip + .LC298]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call strcmp
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L296
    xor eax, eax
    call chrome
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
    jmp .L297
.L296:
    lea rax, [rbp - 128]
    push rax
    .section .rodata
.LC301: .string "ver"
    .section .text
    lea rax, [rip + .LC301]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call strcmp
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L299
    .section .rodata
.LC302: .string "nano-os 0.2, framebuffer edition\n"
    .section .text
    lea rax, [rip + .LC302]
    push rax
    pop rdi
    xor eax, eax
    call puts
    jmp .L300
.L299:
    lea rax, [rbp - 128]
    push rax
    .section .rodata
.LC305: .string "fbinfo"
    .section .text
    lea rax, [rip + .LC305]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call strcmp
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L303
    xor eax, eax
    call cmd_fbinfo
    jmp .L304
.L303:
    lea rax, [rbp - 128]
    push rax
    .section .rodata
.LC308: .string "pci"
    .section .text
    lea rax, [rip + .LC308]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call strcmp
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L306
    xor eax, eax
    call cmd_pci
    jmp .L307
.L306:
    lea rax, [rbp - 128]
    push rax
    .section .rodata
.LC311: .string "demo"
    .section .text
    lea rax, [rip + .LC311]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call strcmp
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L309
    xor eax, eax
    call cmd_demo
    jmp .L310
.L309:
    lea rax, [rbp - 128]
    push rax
    .section .rodata
.LC314: .string "bars"
    .section .text
    lea rax, [rip + .LC314]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call strcmp
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L312
    xor eax, eax
    call cmd_bars
    jmp .L313
.L312:
    lea rax, [rbp - 128]
    push rax
    .section .rodata
.LC317: .string "grad"
    .section .text
    lea rax, [rip + .LC317]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call strcmp
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L315
    xor eax, eax
    call cmd_grad
    jmp .L316
.L315:
    lea rax, [rbp - 128]
    push rax
    .section .rodata
.LC320: .string "lines"
    .section .text
    lea rax, [rip + .LC320]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call strcmp
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L318
    xor eax, eax
    call cmd_lines
    jmp .L319
.L318:
    lea rax, [rbp - 128]
    push rax
    .section .rodata
.LC323: .string "circles"
    .section .text
    lea rax, [rip + .LC323]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call strcmp
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L321
    xor eax, eax
    call cmd_circles
    jmp .L322
.L321:
    lea rax, [rbp - 128]
    push rax
    .section .rodata
.LC326: .string "font"
    .section .text
    lea rax, [rip + .LC326]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call strcmp
    test rax, rax
    sete al
    movzx rax, al
    test rax, rax
    jz .L324
    xor eax, eax
    call cmd_font
    jmp .L325
.L324:
    lea rax, [rbp - 128]
    push rax
    .section .rodata
.LC329: .string "echo "
    .section .text
    lea rax, [rip + .LC329]
    push rax
    pop rsi
    pop rdi
    xor eax, eax
    call starts_with
    test rax, rax
    jz .L327
    lea rax, [rbp - 128]
    push rax
    mov rax, 5
    mov rcx, rax
    pop rax
    add rax, rcx
    push rax
    pop rdi
    xor eax, eax
    call puts
    mov rax, 10
    push rax
    pop rdi
    xor eax, eax
    call putc
    jmp .L328
.L327:
    .section .rodata
.LC330: .string "unknown: "
    .section .text
    lea rax, [rip + .LC330]
    push rax
    pop rdi
    xor eax, eax
    call puts
    lea rax, [rbp - 128]
    push rax
    pop rdi
    xor eax, eax
    call puts
    mov rax, 10
    push rax
    pop rdi
    xor eax, eax
    call putc
.L328:
.L325:
.L322:
.L319:
.L316:
.L313:
.L310:
.L307:
.L304:
.L300:
.L297:
.L294:
.L292:
.L277:
    jmp .L276
.L278:
    mov rax, 0
    leave
    ret
    leave
    ret
    .section .data
    .align 8
g_panel_h: .zero 8
g_panel_w: .zero 8
g_panel_y: .zero 8
g_panel_x: .zero 8
g_keymap: .zero 128
g_have_fb: .zero 8
vga_col: .zero 8
vga_row: .zero 8
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
