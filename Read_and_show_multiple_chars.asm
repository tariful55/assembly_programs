.model small
.stack 100h
.data
m1 db "Type 5 characters: $"
m2 db 0ah,0dh, "You have Typed: $"
array db 5 dup(?)
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah, 9h
    mov dx,offset m1
    int 21h
    
    mov si,0
    mov cx,5
    
Loop_:
    mov ah,1h
    int 21h
    mov array[si],al
    inc si
    mov ah,2h
    mov dl,' '
    int 21h
    Loop Loop_
    
Result:
mov ah,9h
mov dx,offset m2
int 21h


    mov si,0
    mov cx,5
    
 Print:
     mov ah,2h
     mov dl,array[si]
     int 21h
     inc si
     loop Print
     
     
     
     mov ah, 4ch
     int 21h
     
end main

