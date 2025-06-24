.model small
.stack 100h

.data
    msg db 'Hello, World!$'   

.code
main:
    mov ax, @data
    mov ds, ax

    ; Print the message
    mov dx, offset msg       
    mov ah, 09h              
    int 21h                  

    ; Exit program
    mov ah, 4Ch              
    int 21h                  

end main

