; reads input from the console and writes it back.

section .data
    prompt db "Enter the message: ", 0
    fmt_in db `%[^\n]`, 0  ; Read input until newline
    fmt_out db "%s", 10, 0

section .bss
    message resb 256  ; Reserve 256 bytes for the message

section .text
    global main
    extern printf, scanf

main:
    push rbp
    mov rbp, rsp

    ; Print prompt
    lea rcx, [rel prompt]
    call printf

    ; Read input
    lea rcx, [rel fmt_in]
    lea rdx, [rel message]
    call scanf

    ; Print the entered message
    lea rcx, [rel fmt_out]
    lea rdx, [rel message]
    call printf

    ; Clean up and return
    mov rsp, rbp
    pop rbp
    ret
