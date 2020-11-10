include macros.lib
.286
LEE_CADe MACRO BUFFER,taman ;SI SIRVE :b
    MOV AH,3FH
    MOV BX,0
    MOV CX,50;MAXIMO DE CARACTERES DE LA CADENA
    LEA DX,BUFFER
    INT 21H
ENDM
.MODEL SMALL ;DECLARACION DEL MODELO DE MEMORIA
.STACK 64
.DATA
    CADENA Db 50 DUP (?), '$' 
    TAM  Db 0,'$'
    LN DB 0AH,0DH,'$'
.CODE
MAIN PROC FAR
    MOV AX, @DATA  
    MOV DS,AX
    MOV ES,AX
    lee_cade cadena,tam
    write ln
    write cadena
    write ln
    
    mov al, size cadena
    mov tam, al
    write tam
    
FIN:
.EXIT
        
MAIN ENDP
READ PROC
   MOV AH,01H
   INT 21H
   RET
READ ENDP
END MAIN
