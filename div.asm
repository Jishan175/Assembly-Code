.model small
.stack 100h
.data
msg1 db 'enter a value: $'
msg2 db ' is divisible by $'
msg3 db ' is not divisible by $'
var1 dw 0 
var2 db 0

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    input:
    mov ah, 1
    int 21h
    cmp al, 0dh
    je next
    
    and ax, 0fh
    push ax
    
    mov ax, 10
    mul bx
    pop bx
    add bx, ax
    jmp input
    
    
    next:
    mov var1, bx
    mov ax, 0
    mov bx, 0
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    input2:
    mov ah, 1
    int 21h
    cmp al, 0dh
    je div
    
    and ax, 0fh
    push ax
    
    mov ax, 10
    mul bx
    pop bx
    add bx, ax
    jmp input2  
    
    
    div:
    mov var2, bl
    mov ax, var1
    div var2
    cmp ah, 0
    je ok   
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    call var1 print
    mov ah, 9
    lea dx, msg3
    int 21h
    
    call var2print
    jmp exit
    
    ok:
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h  
    
    call var1print
      
    mov ah, 9
    lea dx, msg2
    int 21h  
    
    call var2print

    
    exit:
    mov ah, 4ch
    int 21h
    main endp
    
    
    var1print proc  
    mov ax, var1
    xor cx, cx
    mov bx, 10d
    
    repeat1:
    xor dx, dx
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
    var1print endp  
    
    
    
    var2print proc  
    mov ax, 0
    mov al, var2
    xor cx, cx
    mov bx, 10d
    
    repeat2:
    xor dx, dx
    div bx
    push dx
    inc cx
    
    or ax, ax
    jne repeat2
    
    mov ah, 2
    print2:
    pop dx
    or dl, 30h
    int 21h
    loop print2
    
    ret
    var2print endp   
    
    end main
    
    