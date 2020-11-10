.286
.MODEL SMALL
WRITE MACRO LETRERO
    MOV AH, 09H
    LEA DX, LETRERO
    INT 21H
ENDM


.STACK
.DATA
    LETRERO1 DB 'DAME UN NOMBRE: ','$'
    LETRERO2 DB 'EL NOMBRE ES: ','$'
    VALOR DB 20 DUP(?),'$'
    LN DB 0AH,0DH,'$'
    TEM DB '','$'
.CODE

MAIN PROC FAR
        MOV AX,@DATA    
        MOV DS,AX     

        WRITE LETRERO1
        MOV SI,0        ;SI COMIENZA CON 0
        ciclo:  
        CALL READ
        CMP AL,0DH
        JE SALIR
        MOV VALOR[SI], AL
        ADD SI,1
        CMP SI,20
        JNE ciclo
        
        SALIR:
        WRITE VALOR
        
        .EXIT
MAIN ENDP

READ PROC
    MOV AH,01H
    INT 21H
    RET
READ ENDP

END MAIN