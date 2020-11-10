include macros.lib
 
.MODEL SMALL

.STACK 64

.DATA
    STRING DB 50 DUP (?),'$'
    ;CHAR DB (?),'$'
    LN   DB 0AH,0DH,'$'
.CODE

MAIN PROC FAR
    MOV AX, @DATA    
    MOV DS,AX  

    READ_S STRING
    WRITE LN
    WRITE STRING
    
    FIN:
    .EXIT
MAIN ENDP
END MAIN