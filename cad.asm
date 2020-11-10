INCLUDE MACROS.LIB

leern macro arre
    LOCAL LEER, SALIRR
    mov si,0
leer:
    call read
    cmp al,salto
    je salirr
    mov arre[si],al
    inc si
    
    jmp leer
salirr:
endm

.286
.MODEL SMALL ;DECLARACION DEL MODELO DE MEMORIA
.STACK 64
.DATA
    LET1 DB 'INGRESA UNA CADENA: $',0AH,0DH
    LET2 DB 0AH,0DH, 'SON IGUALES $'
    LET3 DB 0AH,0DH,'SON DIFERENTES $'
    CARAC DB ?, '$'
    CADENA DB "HOLAEIOU", '$'  
    ;TAM EQU $ -CADENA
    LN DB 0AH,0DH,'$'
    POS DW ?, '$'
    CAD1 db 10 dup (?),'$'
    CAD2 db 10 dup (?),'$'
    salto db 0DH,'$'
    TAM DW ?, '$'
    TAM2 DW ?, '$'
.CODE
MAIN PROC FAR
    MOV AX, @DATA  
    MOV DS,AX
    MOV ES,AX ; --
    ;clrscrn 13h ;
    write let1
    leern CAD1
    MOV TAM, SI
    write let1
    leern CAD2
    WRITE LN
    ;compaRAR TAMA?OS CAD
    CMP TAM, SI
    JB UNO
    MOV TAM2,SI
    CLD
    MOV DI,OFFSET CAD1
    MOV SI,OFFSET CAD2
    MOV CX,TAM2; tam de la cad peque?a
    REP MOVSB
    JMP SALIR
UNO:
    CLD
    MOV SI,OFFSET CAD1
    MOV DI,OFFSET CAD2
    MOV CX,TAM; tam de la cad peque?a
    REP MOVSB
SALIR:
    WRITE CAD1
    WRITE LN
    WRITE CAD2
    
FIN:
.EXIT
        
MAIN ENDP
READ PROC
   MOV AH,01H
   INT 21H
   RET
READ ENDP
END MAIN
