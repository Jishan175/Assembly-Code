.MODEL SMALL 
.STACK 100H
.CODE
MAIN PROC
    XOR BX,BX
    MOV CL,4
    MOV AH,1
    INT 21H
    
    WHILE:
    
    CMP AL,0DH
    JE END
    CMP AL,39H
    JG LETTER
    AND AL,0FH
    JMP SHIFT
    
    LETTER:
    SUB AL,37H
    
    SHIFT:
    SHL BX,CL
    OR BL,AL
    INT 21H
    JMP WHILE
    
    END:
    
    MOV AH,2              
    MOV DL,0AH             
    INT 21H                
    MOV DL,0DH             
    INT 21H 
  
    MOV CL,1
    MOV CH,0
    
    OUTPUT:
          CMP CH,4         
          JE EXIT          
          INC CH           
        
          MOV DL,BH        
          SHR DL,4         
        
          CMP DL,0AH       
          JL DIGIT         
        
          ADD DL,37H       
          MOV AH,2         
          INT 21H          
          ROL BX,4         
          JMP OUTPUT       
        
    DIGIT:
        ADD DL,30H         
        MOV AH,2
        INT 21H            
        ROL BX,4           
        JMP OUTPUT         
    
    EXIT:   
    MOV AH,4CH
    INT 21H
            
    
    MAIN ENDP
END MAIN