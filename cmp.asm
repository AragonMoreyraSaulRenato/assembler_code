;------------ M A C R O S ------------
WRITE MACRO let
    MOV AH,09H
    LEA DX,let
    INT 21H
ENDM

READSTRING MACRO cadena,longitud
    MOV AH,3FH
    MOV BX,00
    MOV CX,longitud
    LEA DX,cadena
    INT 21H
ENDM

.286
.MODEL SMALL;
;---------------STACK-----------------
.STACK 64
;----------------DATA-----------------
.DATA
    cad1 DB 10 DUP(?),0DH,0AH,'$' 
    cad2 DB 10 DUP(?),0DH,0AH,'$' 
    let1 DB  'Ingresa un texto:',0DH,0AH,'$'
    let2 DB  'SON IGUALES',0DH,0AH,'$'
    let3 DB  'SON DIFERENTES',0DH,0AH,'$'
;---------------CODE------------------
.CODE
main PROC FAR
    MOV AX,@data
    MOV DS,AX
    MOV ES,AX

    ; Para  que funcione  la lectura con la   interrupcion
    ; 3FH es necesario  definir la cadena que se va a leer
    ; del mismo tama?o con el que se declaro, en este caso 
    ; es de 10.
    
    WRITE let1   
    READSTRING cad1,10
    
    WRITE let1
    READSTRING cad2,10
    
    LEA SI,cad1
    LEA DI,cad2
    
    REPE CMPSB
    JE iguales
    JNE diferentes
    
iguales:
    WRITE let2
    .EXIT
    
diferentes:
    WRITE let3
    .EXIT

RET
main ENDP 
END main