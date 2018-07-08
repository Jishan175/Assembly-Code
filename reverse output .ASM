.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
   
    
    CALL P1
    
    P1 PROC
        
        CALL P2 
        MOV AH,2
        MOV DL,'1'
        INT 21H
        CALL P4
        RET
        
        P2 PROC
            CALL P3
            MOV AH,2
            MOV DL,'2'
            INT 21H
            RET
            
            P3 PROC
                
                MOV AH,2
                MOV DL,'3'
                INT 21H
                RET
                
                
                P4 PROC    
                MOV AH,4CH
                INT 21H
              
                
                
             
                
                