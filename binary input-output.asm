.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    XOR BX,BX
    MOV AH,1
    INT 21H
    
    WHILE:
    CMP AL,0DH
    JE END
    AND AL,0FH
    SHL BX,1
    OR BL,AL
    INT 21H
    JMP WHILE  
    
    END:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV CX,16
    LEVEL:
    ROL BX,1
    JC Print1
    JMP Print2
     
    
    Print1:
    MOV AH,2
    MOV DL,'1'
    INT 21H
    LOOP LEVEL
    JMP EXIT
    
    Print2:
    MOV AH,2
    MOV DL,'0'
    INT 21H
    LOOP LEVEL
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN