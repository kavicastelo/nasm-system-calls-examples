; this program writes a file from the console input

section .data
    filename db "test.txt", 0
    write_mode db "w", 0
    prompt db "Enter the message: ", 0
    fmt_in db `%[^\n]`, 0
    success_msg db "File written successfully.", 10, 0
    error_msg db "Failed to open the file.", 10, 0

section .bss
    buffer resb 1024
    hFile resq 1

section .text
    global main
    extern printf, scanf, fopen, fwrite, fclose

main:
    push rbp
    mov rbp, rsp

    sub rsp, 32  ; Allocate shadow space

    ; Print prompt
    lea rcx, [rel prompt]
    call printf

    ; Read input
    lea rcx, [rel fmt_in]
    lea rdx, [rel buffer]
    call scanf

    ; Open the file
    lea rcx, [rel filename]  ; Filename
    lea rdx, [rel write_mode] ; Write mode
    call fopen
    mov [rel hFile], rax     ; Store file handle

    ; Check if the file was opened successfully
    cmp rax, 0
    je file_error

    ; Write file content
    lea rcx, [rel buffer]   ; Buffer
    mov rdx, 1              ; Size of each item (1 byte)
    call strlen             ; Calculate length of input
    mov r8, rax             ; Number of items (actual length of input)
    mov r9, [rel hFile]     ; File handle
    call fwrite

    ; Close the file
    mov rcx, [rel hFile]
    call fclose

    ; Print success message
    lea rcx, [rel success_msg]
    call printf

    leave
    ret

file_error:
    ; Print error message
    lea rcx, [rel error_msg]
    call printf

    leave
    ret

; Function to calculate the length of the input string (strlen)
strlen:
    push rdi
    mov rdi, rcx
    xor rax, rax
loop_strlen:
    cmp byte [rdi + rax], 0
    je end_strlen
    inc rax
    jmp loop_strlen
end_strlen:
    pop rdi
    ret
