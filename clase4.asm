.286
.MODEL SMALL

.STACK

.DATA

mensaje DB 'Hello'
tam_men = $-mensaje

.CODE

MAIN PROC FAR
      MOV AX, @DATA    
      MOV DS,AX         

      MOV AH, 40H
      MOV BX, 0001H
      MOV CX, tam_men
      LEA DX, mensaje
      INT 21H
      
      .EXIT
MAIN ENDP
END MAIN