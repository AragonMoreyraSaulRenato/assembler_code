include macros.lib
 
.MODEL SMALL

.STACK 64

.DATA
    A1    DB 'ACTIVADO','$'
    A2    DB 'DESACTIVADO','$'
.CODE

MAIN PROC FAR
    MOV AX, @DATA    
    MOV DS,AX   
    
    MOV AX,1H
    INT 033H
    CMP AX,0
    JE NOESTA
    WRITE A1
    JMP FIN
    
NOESTA:
    WRITE A2
    
    FIN:
    .EXIT
MAIN ENDP

READ PROC
    MOV AH,01H
    INT 21H
    RET
READ ENDP

END MAIN