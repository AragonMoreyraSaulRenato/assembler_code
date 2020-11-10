TITLE
.286
spila SEGMENT stack
      DB 32 DUP ('stack___')
spila ENDS
sdatos SEGMENT
        arre DB 1,2,3,4,5,'$'
        ;num  DB(0);  
sdatos ENDS
scodigo SEGMENT 'CODE'
        Assume ss:spila, ds:sdatos, cs:scodigo
Princ PROC FAR
        PUSH DS
        PUSH 0
        MOV AX, sdatos  
        MOV ds,AX  
        
        MOV SI,0        ;SI COMIENZA CON 0
ciclo:  CMP SI,5        ;INICIA CICLO
        JAE imp         ;COMPARAMOS SI>=5 SE VA A IMPRIMIR
        
        CMP arre[SI],3  
        JAE suma        ;COMPARAMOS ARRE[SI]>=3 SE VA A SUMA
   
        ADD arre[SI],1  ;SUMA 1 A ARRE[SI] IF < 3
        
suma:   MOV AL, arre[SI];AGREGAMOS 30H PARA PARA IMPRIMIR
        ADD AL, 30H
        MOV arre[SI],AL
        
        ADD SI,1        ;AGREGAMOS 1 A SI
        JMP ciclo       ;SALTO INCONDICIONAL A CICLO
        
imp:    LEA DX, arre     
        MOV AH,09H
        INT 21H
        RET
Princ ENDP
scodigo ENDS
END Princ  
