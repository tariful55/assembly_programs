.model small
.stack 100h
.data
m1 db "Original Value: 10010011 $"
m0 db 0ah,0dh, "Results (in Decimal): $"
m2 db 0ah,0dh, "Set 2nd and 5th bit = $"
m3 db 0ah,0dh, "Clear 1st and 4th bits = $"
m4 db 0ah,0dh, "Toggle 2nd and 3rd bit = $"  
.code
main proc
    mov ax, @data
    mov ds, ax
    mov ah, 9h
    mov dx, offset m1
    int 21h 
    mov al, 10010011b   
    mov cl, al         
    mov ah, 9h
    mov dx, offset m0
    int 21h    
    mov ah, 9h
    mov dx, offset m2
    int 21h
    mov al, cl           
    or al, 00100100b   
    xor ah, ah           
    call PrintNumber

    mov ah, 9h
    mov dx, offset m3
    int 21h

    mov al, cl          
    and al, 11101101b   
    xor ah, ah
    call PrintNumber

    mov ah, 9h
    mov dx, offset m4
    int 21h

    mov al, cl           
    xor al, 00001100b    
    xor ah, ah
    call PrintNumber 

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

;=========================
; PrintNumber: prints AX as decimal
;=========================
PrintNumber proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
    mov bx, 10
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

    pop dx
    pop cx
    pop bx
    pop ax
    ret
PrintNumber endp

end main
