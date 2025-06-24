.model small
.stack 100h
.data
   m1 db "Type the first digit: $"
   m2 db 0ah,0dh, "Type the second digit: $"
   m3 db 0ah,0dh, "Result: $"

.code
main proc
    mov ax,@data
    mov ds,ax
                    
    mov dx, offset m1
    mov ah,09h
    int 21h
    
    mov ah,1h
    int 21h
    sub al,'0'
    mov bl,al

    mov dx, offset m2
    mov ah,09h
    int 21h
    
    mov ah,1h 
    int 21h
    sub al,'0'

    ; sum operation
    add bl,al

    add bl,'0'

    ;print answer
    mov dx, offset m3
    mov ah,9h
    int 21h
    
    mov ah,2h
    mov dl,bl
    int 21h



    mov ah,4Ch
    int 21h

end main
