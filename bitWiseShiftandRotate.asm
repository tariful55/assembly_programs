.model small
.stack 100h
.data
m1 db "Original value, AX=09bh $"
m0 db 0ah,0dh, "Results are in decimal:  $"
m2 db 0ah,0dh, "The 1 bit left shifted value= $"
m3 db 0ah,0dh, "The 1 bit right shifted value= $"
m4 db 0ah,0dh, "The 1 bit left rotated value= $"
m5 db 0ah,0dh, "The 1 bit right rotated value= $"
.code

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9h
    mov dx, offset m1
    int 21h        
    mov ah, 9h
    mov dx, offset m0
    int 21h
    mov ax,09bh
    mov si,ax
    
    ;Shifting part 
    mov ah, 9h
    mov dx, offset m2
    int 21h
    mov ax, si
    shl ax,1
    call PrintNumber 
      
    mov ah, 9h
    mov dx, offset m3
    int 21h
    mov ax, si  
    shr AX,1
    call PrintNumber

    ; Rotation part
    mov ah, 9h
    mov dx, offset m4
    int 21h
    mov ax, si
    rol ax,1
    call PrintNumber     
    
    mov ah, 9h
    mov dx, offset m5
    int 21h
    mov ax, si  
    ror AX,1
    call PrintNumber

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

PrintNumber proc

.next_digit:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne .next_digit

.print_digits:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop .print_digits

PrintNumber endp
end main
