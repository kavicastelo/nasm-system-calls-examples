; This program reads a file and prints its content to the console.

section .data
    filename db "test.txt", 0  ; The name of the file to read
    read_mode db "r", 0
    prompt db "File content:", 10, 0
    buffer_size equ 1024
    hFile dq 0
    buffer db buffer_size dup(0)
    error_msg db "Failed to open the file.", 10, 0
    read_msg db "Bytes read: %d", 10, 0

section .text
    extern printf, fopen, fread, fclose
    global main

main:
    push rbp
    mov rbp, rsp

    sub rsp, 32  ; Allocate shadow space

    ; Open the file
    lea rcx, [rel filename]  ; Filename
    lea rdx, [rel read_mode] ; Read mode
    call fopen
    mov [rel hFile], rax     ; Store file handle

    ; Check if the file was opened successfully
    cmp rax, 0
    je file_error

    ; Read file content
    lea rcx, [rel buffer]   ; Buffer
    mov rdx, 1              ; Size of each item (1 byte)
    mov r8, buffer_size - 1 ; Number of items (leave space for null-terminator)
    mov r9, [rel hFile]     ; File handle
    call fread

    ; Check how many bytes were read
    mov rdi, rax            ; Store the number of items read
    lea rcx, [rel read_msg]
    mov rdx, rdi            ; Print number of bytes read
    call printf

    ; Null-terminate the buffer
    lea rcx, [rel buffer]
    add rcx, rdi            ; Add number of bytes read to buffer start
    mov byte [rcx], 0       ; Null-terminate after the last byte read

    ; Print the content
    lea rcx, [rel prompt]   ; Print the prompt
    call printf

    lea rcx, [rel buffer]   ; Print the buffer content using printf
    call printf

    ; Close the file
    mov rcx, [rel hFile]
    call fclose

    ; Clean up and exit
    add rsp, 32  ; Restore stack space
    mov rsp, rbp
    pop rbp
    ret

file_error:
    lea rcx, [rel error_msg]
    call printf

    add rsp, 32  ; Restore stack space
    mov rsp, rbp
    pop rbp
    ret
