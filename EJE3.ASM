.286
pila SEGMENT STACK
DB 32 DUP ('STACK...')
pila ENDS


datos SEGMENT
letrero1 DB "Dame los numeros del arreglo ",'$'
letreo2 DB "Dame el numero de la posicion ",'$'
letrero3 DB "El numero en la posicion ",'$'
Arreg DB  5 DUP(?),'$'
saltoL DB 0AH,0DH,'$'  ;salto de linea



datos ENDS


codigo SEGMENT 'CODE'
      ASSUME SS:pila, DS:datos, CS:codigo

Main Proc FAR

      PUSH DS
      PUSH 0
      MOV AX, datos
      MOV DS, AX


      MOV SI,0   ; inicializamos el contador SI

      LEA DX,letrero1      ;Desplegamos letrero1 dame los numeros del arreglo
      MOV AH,09H
      INT 21H

      LEA DX,saltoL    ;salto de linea
      MOV AH,09H
      INT 21H

     leer:

      LEA DX,letreo2  ; Desplegamos letrero2 dame el numero en la posicion
      MOV AH,09H
      INT 21H


      MOV DX,SI
      ADD DL,30H       ; nos imprime la posicion
      MOV AH,02H
      INT 21H

      MOV DX,58        ; imprimimos dos puntos
      MOV AH,02H
      INT 21H





      MOV AH,01H    ; mover a AH la 01H es para pedir caracter de pantalla
      INT 21H              ; de la interrupcion 21h
      MOV Arreg[SI],AL    ;; movemos para la localidad del arreglo lo que se guardo en AL

      LEA DX,saltoL    ;salto de linea
      MOV AH,09H
      INT 21H

      INC SI      ; incrementamos SI
      CMP SI,5     ; COMPARAMOS
      JB leer       ; SI ES MENOR VOLVEMOS A LEER

      MOV SI,0    ; SI YA NO SE COMPLE INICIALIMOS


     mostrar:

     LEA DX,letrero3
     MOV AH,09H           ; imprimimos letrero3
     INT 21H


     MOV DX,SI            ; imprimimos la posicion
     ADD DL,30H
     MOV AH,02H
     INT 21H

     MOV DX,58         ;imprimimos los dos puntos
     MOV AH,02H
     INT 21H


      MOV DL,Arreg[SI]   ; lo leemos
      MOV AH,02H  ; interrupcion para la pantalla
      INT 21H



      MOV DX,OFFSET saltoL      ; salto de linea 
      MOV AH,09H
      INT 21H

      INC SI
      CMP SI,5
      JB mostrar
     salir:
RET
Main ENDP
codigo ENDS
END Main
