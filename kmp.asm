INCLUDE MACROS.LIB
.286
.MODEL SMALL
.STACK 64
.DATA
    a DB 50 DUP (?),'$'
    TAM1 DW (0)
    b DB 50 DUP (?),'$'
    TAM2 DW (0)
    LN DB 0AH,0DH,'$'
.CODE
MAIN PROC FAR
    ;EN ESTA CLASE VIMOS CMP DE CADENA
    ;CMPSB, COMPSW
    MOV AX, @DATA  
    MOV DS,AX
    
    call read 
    mov b, al
    call read
    
    
    
        FIN:
    .EXIT
MAIN ENDP

READ PROC
    MOV AH,01H
    INT 21H
    RET
READ ENDP

END MAIN