INCLUDE MACROS.LIB

.286
.MODEL SMALL ;DECLARACION DEL MODELO DE MEMORIA
.STACK 64
.DATA
    LET1 DB 'A E I O U $'
    LET2 DB 'COINCIDENCIAS: $'
    SALIR DB 'SALIR $'
    REPETIR DB 'REPETIR $'
    CADENA DB 50 DUP (?),'$'
    CHAR DB (?),'$' 
    TAM_CAD = $-CADENA
    LN DB 0AH,0DH,'$'
    POS DB 0, '$'
    CONT DB 0, '$'
    CORDX DB 0, '$'
    CORDY DB 0, '$'
    .CODE
MAIN PROC FAR
    MOV AX, @DATA  
    MOV DS,AX
    MOV ES,AX
    CLEAR
    GOTOXY 0,0
    READ_S CADENA, TAM_CAD
    
    INI:
    CLEAR
    GOTOXY 0,0
    WRITE CADENA
    GOTOXY 0,1
    WRITE LET1
    CHARSELECT CHAR, CORDX, CORDY
    GOTOXY 0,5
    WRITE SALIR
    GOTOXY 10,5
    WRITE REPETIR
    
    
    
    CLD
    MOV CX,TAM_CAD
    MOV SI,0
    
    CICLO:
    MOV AL,CHAR
    CMP SI,50
    JAE IMP
    CMP CADENA[SI],AL
    JNE INCRE
    INC CONT
    DWTODB SI, POS
    PUSHA
    RESALTAXY POS,0
    POPA
    INCRE:
    INC SI
    LOOP CICLO
    
    
    IMP:
    
    GOTOXY 0,0
    WRITE CADENA
    GOTOXY 0,2
    ADD CONT,30H
    WRITE LN
    WRITE LET2
    WRITE CONT
    MOV CONT, 0
    
    JMP MOU
    
    INICIO:
    JMP INI
    
    MOU:
    MOUSE
    MOV CORDY,0
    MOV CORDX,0
    MOV CHAR,0
    CMP BX,1
    JE FILA
    JMP MOU
    
    FILA:
    DIVNUM DX,8,CORDY
    
    CMP CORDY,5
    JNE MOU
    
    DIVNUM CX,8,CORDX
    
    CMP CORDX, 5
    JBE FIN
    
    CMP CORDX,10
    JB MOU
    
    CMP CORDX,17
    JB INICIO
FIN:
.EXIT
        
MAIN ENDP
END MAIN

CHARSELECT MACRO LETRA, CORDY, CORDX
    LOCAL WHILE_1,NEXT_1,FIN
    WHILE_1:
        MOUSE
        CMP BX,1
        JE NEXT_1
    JMP WHILE_1
    
    NEXT_1:
    
    MOV AX,DX
    MOV BL,8
    DIV BL
    MOV CORDY,AL
    CMP CORDY,1
    JE A
    CMP CORDY, 5
    JE FILAS
    
    MOV AX,CX
    MOV BL,8
    DIV BL
    MOV CORDX,AL
   
    A:  
    CMP CORDX,0
    JNE E
    MOV LETRA,41H  
    JMP FIN
    
    E:  CMP CORDX,2
    JNE I
    MOV LETRA,45H
    JMP FIN 
    
    I:  
    CMP CORDX,39
    JNE O
    MOV LETRA,49H
    JMP FIN
    
    WHILE_2:
    JMP WHILE_1
    
    O:  CMP CORDX,4
    JNE U
    MOV LETRA,4FH
    JMP FIN
    
    U:  
    CMP CORDX,6
    JNE WHILE_2
    MOV LETRA,55H
    JMP FIN
ENDM