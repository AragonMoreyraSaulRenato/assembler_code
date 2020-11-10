INCLUDE MACROS.LIB




.MODEL SMALL ;DECLARACION DEL MODELO DE MEMORIA
.STACK 64
.DATA
    LET0 DB 'INGRESA UNA CADENA: $'
    LET1 DB 'INGRESA UNA SUBCADENA: $'
    LET2 DB 'ES CADENA $'
    LET3 DB 'NO ES CADENA $'
    CAD1 DB 50 DUP (?),'$'
    CAD2 DB 50 DUP (?),'$'
    LN DB 0AH,0DH,'$'
    CAD1L DW 0, '$'
    CAD2L DW 0, '$'
    POS DB 0, '$'
    .CODE
MAIN PROC FAR
    MOV AX, @DATA  
    MOV DS,AX
    MOV ES,AX
    
    MOV CAD1L,50
    MOV CAD2L,50
    ;WRITE LET0
    READ_CADE CAD1,CAD1L
    
    ;WRITE LET1
    READ_CADE CAD2,CAD2L
    
    MOV SI,0
    CICLO1:
    CMP SI,CAD1L
    JAE NOE1
    
        MOV AL, CAD2[0]
        CMP CAD1[SI], AL
        JNE IC1
            DWTODB SI,POS
            RESALTAXY POS, 0
            MOV DI,1
            CICLO2:
            CMP DI, CAD2L
            JAE IC1
            MOV AL, CAD2[DI]
            ADD DI,SI
            CMP CAD1[DI], AL
            JNE IC1
            JMP NEXT
            
            NOE1:
            JMP NOE
            
            NEXT:
            DWTODB DI,POS
            RESALTAXY POS, 0
            SUB DI,SI
            INC DI
            CMP DI,CAD2L
            JE EXISTE
            JMP CICLO2
        IC1:
        ADD SI,1
    JMP CICLO1
    CMP DI,CAD2L
    JNE NOE
    EXISTE:
    GOTOXY 0,2
    WRITE LET2
    GOTOXY 0,0
    WRITE CAD1
    JMP FIN
    NOE:
    WRITE LN
    WRITE LET3
    
    
    
FIN:
WRITE LN
WRITE LN
.EXIT
        
MAIN ENDP
END MAIN
