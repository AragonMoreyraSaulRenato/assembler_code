TITLE
.286
.MODEL SMALL;
include MACROS.LIB
.STACK 64;

.DATA
     LET1 DB 'Ingresa una cadena: ','$'
     LET2 DB 'La cadena 2 es subcadena de la cadena 1: ','$'
     LET3 DB 'La cadena 2 NOj es subcadena de la cadena 1: ','$'
     CAD1 DB 20 DUP (0),'$'
     CAD2 DB 20 DUP (0),'$'
     ESTADO DB 0,'$'
     LN    DB 0AH,0DH,'$'
     TAM_CAD = $-CAD1
.CODE
 main PROC FAR
       PUSH DS
       PUSH 0
       MOV AX,@data
       MOV DS,AX
       MOV ES,AX
     
       
       WRITE LET1
       READ_S CAD1,20
       WRITE LN
       WRITE LET1
       READ_S CAD2,20
       
       MOV BX,0
       MOV AL,CAD2[BX]
       MOV CX,TAM_CAD
       CLD
       LEA DI,CAD1
       REPETIR:
       REPNE SCASB
       JNE NOEXISTE
       LEA DX,CAD1
       SUB DI,DX
       DEC DI
       AUMENTAR:
       INC BX
       INC DI
       DEC CX
       MOV AL,CAD2[BX]
       CMP CAD1[DI],AL
       JE  AUMENTAR
       CMP CAD2[BX],24H
       JBE EXISTE
       ADD DI,DX
       MOV BX,20
       MOV AL,CAD2[BX]
       JMP REPETIR
       NOEXISTE:
       WRITE LN
       WRITE LET3
       JMP SALIR
       
       EXISTE:
       WRITE LN
       WRITE LET2
       JMP SALIR
       SALIR: 
       RET
main ENDP
END main    