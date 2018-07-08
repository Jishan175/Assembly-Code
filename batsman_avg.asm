.model small

.stack 100h
.data
four dw 4
scores dw 79, 88, 15, 102
       dw 55, 76, 44, 31
       dw 17, 72, 99, 105
       dw 49, 99, 79, 38
   
avg dw 4 DUP(0) 
temp1 dw 0
temp2 dw 0

.code
main proc
    mov ax, @data
    mov ds, ax
    
    
    mov bx, 0
    repeat:
    mov cx, 4
    mov si, 6
    mov ax, 0
    
    for:
    add ax, scores[si + bx]
    sub si, 2
    loop for
    
    add bx, 8
    mov dx, 0
    div four
    mov temp2, si
    mov si, temp1
    mov avg[si], ax
    mov si, temp2
    
    add temp1, 2
    
    cmp temp1, 6
    jg next  
    
    jmp repeat
    
    next:
    
    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov dx, 0
    mov si, 0 
    printer:
    mov ax, avg[si]
    call outdec 
    mov ah, 2
    mov dl, 0dh
    int 21h
    mov dl, 0ah
    int 21h
    add si, 2
    
    cmp si, 6
    jg exit 
    
    jmp printer
    
    exit:
    
    mov ah, 4ch
    int 21h
    main endp

outdec proc
    mov cx, 0
    mov bx, 10d
    repeat1:
    mov dx, 0
    div bx
    push dx
    inc cx  
    
    or ax, ax
    jne repeat1
    
    mov ah, 2
    print:
    pop dx
    or dl, 30h
    int 21h
    loop print
    ret
    outdec endp

end main