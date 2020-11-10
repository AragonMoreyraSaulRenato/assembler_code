include macros.lib
 
READ_CAD MACRO VALOR
    LOCAL NC1
    NC1:  
    CALL READ
    CMP AL,0DH
    JE NA
    MOV VALOR[SI], AL
    ADD SI,1
    CMP SI,20
    JNE NC1

    NA:
ENDM

B_VOCAL MACRO ARRE, V
    LOCAL FOOR,NEXT
    MOV AL,V
    MOV SI,0
    GOTOXY 35,4
    WRITE L4
    FOOR:
    CMP ARRE[SI],AL
    JNE NEXT
    MOV POS,SI
    ADD POS,30H
    WRITE POS
    ADD VECES,1
    NEXT:
    ADD SI,1
    CMP SI,10
    JB FOOR
    
    ADD VECES,30H
    GOTOXY 35,5
    WRITE L3
    WRITE VECES
ENDM


.MODEL SMALL

.STACK 64

.DATA
    
    L1    DB 'INGRESA NOMNBRE: ','$'
    L2    DB 'A E I O U','$'
    L3    DB 'SE REPITE: ','$'
    L4    DB 'POSICIONES: ','$'
    L5    DB 'ESCOGE UNA LETRA','$'
    LN    DB 0AH,0DH,'$'
    
    NOM   DB 10 DUP(?),'$'
    CORDX DB 0,'$'
    CORDY DB 0,'$'
    POS   DW 0,'$'
    LETRA DB '-','$'
    VECES DW 0,'$'
.CODE

MAIN PROC FAR
    MOV AX, @DATA    
    MOV DS,AX   
    
    GOTOXY 35,0
    WRITE L1
    READ_CAD NOM
    
    GOTOXY 35,1
    WRITE L5
    
    GOTOXY 35,2
    WRITE L2
    
    MOUSE
    MOUSE
    
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
    CMP CORDY,2
    JNE WHILE_1
    
    MOV AX,CX
    MOV BL,8
    DIV BL
    MOV CORDX,AL
   
A:  CMP CORDX,35
    JNE E
    MOV LETRA,41H  
    B_VOCAL NOM,LETRA
    JMP FIN
    
E:  CMP CORDX,37
    JNE I
    MOV LETRA,45H
    B_VOCAL NOM,LETRA
    JMP FIN 
    
I:  CMP CORDX,39
    JNE O
    MOV LETRA,49H
    B_VOCAL NOM,LETRA
    JMP FIN
    
    WHILE_2:
    JMP WHILE_1
    
O:  CMP CORDX,41
    JNE U
    MOV LETRA,4FH
    B_VOCAL  NOM,LETRA
    JMP FIN
    
U:  CMP CORDX,43
    JNE WHILE_2
    MOV LETRA,55H
    B_VOCAL NOM,LETRA
    JMP FIN
    
    FIN:
    RET
MAIN ENDP

READ PROC
    MOV AH,01H
    INT 21H
    RET
READ ENDP

END MAIN