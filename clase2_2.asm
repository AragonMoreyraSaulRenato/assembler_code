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
ciclo:  MOV AH,01H
        INT 21H
        MOV arre[SI],AL
        
        
        ADD SI,1        ;AGREGAMOS 1 A SI
        CMP SI,5
        JB ciclo       ;SALTO INCONDICIONAL A CICLO
        
        ;IMPRIME CON UN CICLO
imp:    MOV SI,0        ;SI COMIENZA CON 0
cicl:   LEA DX,ente
        MOV AH,09H
        INT 21H
        
        MOV DL,arre[SI]
        MOV AH,02H
        INT 21H
        
        ADD SI,1        ;AGREGAMOS 1 A SI
        CMP SI,5
        JB cicl     ;SALTO INCONDICIONAL A CICLO
        
        RET
Princ ENDP
scodigo ENDS
END Princ  