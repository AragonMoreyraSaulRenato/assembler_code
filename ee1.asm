.286
pila SEGMENT STACK
	DB 32 DUP ('STACK...')
pila ENDS


datos SEGMENT
	;LETRERO   DB 0AH,'1.-PROGRAMA', 0AH,'2.-SALIR',0AH,'$'
	LETRERO3  DB 0AH,0DH,'rellena arreglo: ','$'
	LETRERO4  DB 0AH,0DH,'dame el numero para la posicion ','$'
	LETRERO5  DB 0AH,0DH,'el numero de la posicion ','$'
	LETRERO2 DB  0AH,0DH,'Contenido del Arreglo: ','$'
	;arreglo de 10 lugares
	Arreg DB 10 DUP (?),'$'

datos ENDS

codigo SEGMENT 'CODE'
	ASSUME SS:pila, DS:datos, CS:codigo
	Main Proc FAR

	PUSH DS
	PUSH 0
	MOV AX, datos
	MOV DS, AX




				;CUERPO DEL PROGRAMA SI NO ES IGUAL A 2 SIGUE CON ESTE codigo
							;IMPRIMO LETERERO
							MOV AH,09H
							LEA DX,LETRERO3
							INT 21h


							;INICIALIZO SI QUE UTILIAZRE COMO CONTADOR
							MOV SI,0
							;ETIQUETA PARA REPETIR EL CICLO
							CICLO:
							;pido un caracter 01h es entrada de caracter CON eco ,08h es SIN eco
							MOV AH,09H
							LEA DX,LETRERO4
							INT 21h

							mov DX,SI
							add Dl,30H
							mov AH,02H
							INT 21H

							mov AH,02H
							mov Dl,58
							int 21H

							mov AH,01h
							INT 21h

							;MUEVO A LA POSICION SI DEL arreglo EL CARACTER LEIDO (ELCARACTER LEIDO SE GUARDA EN AL)
							MOV Arreg[SI],AL
							;INCREMENTO EN UNO EL CONTADOR SI
							INC SI
							;COMPARO SI CONTRA 10 QUE ES EL TAMAÑO DEL ARREGLO
							CMP SI,10
							;SALTA SI ESTA POR DEBAJO
							JB CICLO



							MOV AH,09H
							LEA DX,LETRERO2
							INT 21h

							mov SI,0
							CICLO2:
							cmp Arreg[SI],51
							JBE SUMA
							IMPRIMIR:
							MOV AH,09H
							LEA DX,LETRERO4
							INT 21h

							mov DX,SI
							add Dl,30H
							mov AH,02H
							INT 21H

							mov AH,02H
							mov Dl,58
							int 21H

							mov AH,02h
							mov Dl,Arreg[SI]
							int 21H

							inc SI
							cmp si,10
							JB CICLO2

							JMP SALIR

							SUMA:
							mov Al,Arreg[SI]
							inc al
							mov Arreg[SI],al
							JMP IMPRIMIR

SALIR:
	RET
	Main ENDP
codigo ENDS

END Main
