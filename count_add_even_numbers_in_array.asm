.model small
.stack 100h
.data
arr db 19,4,63,3,5,8
.code
main proc
    
    
    mov dx,@data
    mov ds,dx
    
    mov cx,6
    mov ax,0
    mov bx,0
    mov si,0
    
 loo:
    mov dl,arr[si]
    inc si
    and dl,1
    jz eve
    jnz odd
    
   eve:
   inc bx
   jmp next
   odd:
   inc ax
   next:
   loop loo
   
   
   mov cx,ax
   mov ah,2h
   mov dx,cx 
   add dx,'0'
   int 21h
   
   mov dx,bx 
   add dx,'0'
   mov ah,2h
   int 21h
   
   
   mov ah, 4ch
   int 21h
   
end main
    
    
