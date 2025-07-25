.model small
.stack 100h
.data
m1 db "Taken, AX=96H and BX=5AH $"
m0 db 0ah,0dh, "Results(in Decimal) : $"
m2 db 0ah,0dh, "AND= $"
m3 db 0ah,0dh, "OR= $"
m4 db 0ah,0dh, "XOR= $"  
msg_not db 0dh,0ah, "NOT= $" 
msg_shl db 0dh,0ah, "SHL= $"
msg_shr db 0dh,0ah, "SHR= $"
.code
main proc
    mov ax, @data
    mov ds, ax
    ; Display initial message
    mov ah, 9h
    mov dx, offset m1
    int 21h        
    ; Store original values
    mov ax, 96h
    mov bx, 5ah
    mov si, ax     
    mov di, bx    
    
    mov ah, 9h
    mov dx, offset m0
    int 21h    

    ; AND operation
    mov ah, 9h
    mov dx, offset m2
    int 21h

    mov ax, si
    mov bx, di
    and ax, bx
    call PrintNumber

    ; OR operation
    mov ah, 9h
    mov dx, offset m3
    int 21h

    mov ax, si
    mov bx, di
    or ax, bx
    call PrintNumber

    ; XOR operation
    mov ah, 9h
    mov dx, offset m4
    int 21h

    mov ax, si
    mov bx, di
    xor ax, bx
    call PrintNumber 
    
    
 
    
;Task 2 Not operation

    mov al, 10101100b   
    not al              
    mov ah, 09h
    lea dx, msg_not
    int 21h
         
    call PrintNumber
 

 
    mov al, 10011010b
    mov bl, al

    shl al, 1
    mov ah, 09h
    lea dx, msg_shl
    int 21h

    call PrintNumber

    mov al, bl
    shr al, 1
    mov ah, 09h
    lea dx, msg_shr
    int 21h
   
    call PrintNumber


 

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
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
