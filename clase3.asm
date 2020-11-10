.MODEL SMALL

.STACK
.DATA

mensaje dB 'Hello Word','$'

.CODE

MAIN PROC FAR
      MOV AX, @DATA    
      MOV ds,AX         

      LEA dx,mensaje
      MOV AH, 09H
      INT 21H
      
      .EXIT
MAIN ENDP
END MAIN