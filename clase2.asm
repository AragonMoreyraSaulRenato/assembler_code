TITLE
.286
spila SEGMENT stack
      DB 32 DUP ('stack___')
spila ENDS
sdatos SEGMENT
        arre DB 0,0,0,0,0,'$'
        ente DB 0AH,0DH,'$'
sdatos ENDS
scodigo SEGMENT 'CODE'
        Assume ss:spila, ds:sdatos, cs:scodigo
Princ PROC FAR
        PUSH DS
        PUSH 0
        MOV AX, sdatos  
        MOV ds,AX  
        ;COMENIENZA A LEER CON UN CICLO
        MOV SI,0        ;SI COMIENZA CON 0
ciclo:  CMP SI,5        ;INICIA CICLO
        JAE imp         ;COMPARAMOS SI>=5 SE VA A IMPRIMIR
        
        MOV AH,01H
        INT 21H
        MOV arre[SI],AL
        
        LEA DX,ente
        MOV AH,09H
        INT 21H
        
        ADD SI,1        ;AGREGAMOS 1 A SI
        JMP ciclo       ;SALTO INCONDICIONAL A CICLO
        
        ;IMPRIME CON UN CICLO
imp:    MOV SI,0        ;SI COMIENZA CON 0
cicl:   CMP SI,5        ;INICIA CICLO
        JAE fin        ;COMPARAMOS SI>=5 SE VA A IMPRIMIR
        
        LEA DX,ente
        MOV AH,09H
        INT 21H
        
        MOV DL,arre[SI]
        MOV AH,02H
        INT 21H
        
        ADD SI,1        ;AGREGAMOS 1 A SI
        JMP cicl      ;SALTO INCONDICIONAL A CICLO
        
fin:    RET
Princ ENDP
scodigo ENDS
END Princ  