.model 100h
.code
main proc

    ; Input first digit (tens place)
    mov ah, 1          ; DOS interrupt to read character
    int 21h            ; Get character input
    sub al, '0'        ; Convert ASCII to integer (al = al - '0')
    mov dl, al         ; Save first digit (tens place) in DL

    ; Input second digit (ones place of two-digit number)
    mov ah, 1          ; DOS interrupt to read character
    int 21h            ; Get character input
    sub al, '0'        ; Convert ASCII to integer (al = al - '0')
    mov dh, al         ; Save second digit (ones place) in DH

    ; Create two-digit number (e.g., 45 from 4 and 5)
    mov ax, dx         ; AX = first_digit (tens place) * 10 + second_digit (ones place)
    mov bx, 10
    mul bx             ; Multiply the tens place by 10 (AX = first_digit * 10)
    add ax, dx         ; Add the second digit (AX = two-digit number)

    ; Input third digit (1-digit number to subtract)
    mov ah, 1          ; DOS interrupt to read character
    int 21h            ; Get character input
    sub al, '0'        ; Convert ASCII to integer (al = al - '0')
    mov bl, al         ; Save third input (1-digit number) to BL

    ; Perform subtraction
    sub ax, bx         ; Subtract the 1-digit integer from the 2-digit integer

    ; Output the result (tens and ones places of the result)
    
    ; Output the tens place of the result
    mov dl, ah         ; The tens digit of the result is in AH
    add dl, '0'        ; Convert to ASCII (add '0' to make it printable)
    mov ah, 2          ; DOS interrupt to display character
    int 21h

    ; Output the ones place of the result
    mov dl, al         ; The ones digit of the result is in AL
    add dl, '0'        ; Convert to ASCII (add '0' to make it printable)
    mov ah, 2          ; DOS interrupt to display character
    int 21h

    ; Exit program
exit:
    mov ah, 4Ch        ; DOS interrupt to exit program
    int 21h
main endp
end main
