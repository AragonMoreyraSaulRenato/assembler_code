INCLUDE MACROS.LIB
.286
.MODEL SMALL ;DECLARACION DEL MODELO DE MEMORIA
.STACK 64
.DATA
    LET1 DB 'INGRESA UN CARACTER: $'
    LET2 DB 'ENCONTRADO $'
    LET3 DB 'NO ENCONTRADO $'
    CADENA DB 50 DUP (?),'$'
    CHAR DB (?),'$' 
    TAM_CAD = $-CADENA
    LN DB 0AH,0DH,'$'
    POS DW ?, '$'
    .CODE
MAIN PROC FAR
    MOV AX, @DATA  
    MOV DS,AX
    MOV ES,AX
    
    READ_S CADENA, TAM_CAD
    WRITE CADENA
    WRITE LN
    
    WRITE LET1
    READ_C CHAR
    
    
    CLD
    MOV AL, CHAR
    LEA DI,CADENA
    REPNE SCASB
    JNE NOEXIS
    SUB DI,2
    MOV POS, DI
    WRITE LN
    WRITE POS
    
    JMP FIN
    NOEXIS:
    WRITE LN
    WRITE LET3
FIN:
.EXIT
        
MAIN ENDP
END MAIN