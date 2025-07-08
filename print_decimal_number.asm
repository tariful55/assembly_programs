.model small
.stack 100h
.code
main proc


    mov ax,369 ; here the value 
               ;that should be 
               ;printed
               
               
               
    call print

    mov ah,4ch
    int 21h


print proc
   push ax
   push bx
   push cx
   push dx
   
   mov cx,0
   mov bx,10
.next_digit:
   xor dx,dx
   div bx
   push dx
   inc cx
   cmp ax,0
   jne .next_digit
 .print_digits:
    pop dx
    add dx,'0'
    mov ah,2
    int 21h
    loop .print_digits
    
   
   
   pop dx
   pop cx
   pop bx
   pop ax
   ret
print endp
end main








