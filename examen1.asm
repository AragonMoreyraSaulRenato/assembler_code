include macro.lib
.286

comparar MACRO arreg, letr
LOCAL foor,no,salir
    mov si,0
    mov veces,0
foor:
    mov al,arreg[si]
    cmp al,letr
    jne no 
    mov band,1
    mov aux,si
    add aux,30h
    ;write pos
    ;write aux
    ;write ln
    ;JMP PINTA
    mov px,si
    inc veces
no: inc si
    cmp si,10
    jb foor
    cmp band,1
    je salir
salir:
    add veces,30h
    write ln4
    write veces
endm

.MODEL SMALL ;DECLARACION DEL MODELO DE MEMORIA
.STACK 64
.DATA
    LN DB 0AH,0DH,'$'
    salto db 0DH,'$'
    x dw ('?'),'$'
    y dw ('?'),'$'
    px db('?'),'$'
    py  db('?'),'$' 
    
.CODE
MAIN PROC FAR
    MOV AX, @DATA  
    MOV DS,AX
    MOV ES,AX
    clrscrn 13h
    ;inicia el mouse
    mouse 00h
    ;muestra el cursor
    mouse 01h
    ;iniciar bucle del mouse
bucle:
    mov bx,6h
    mouse 03 ;obtener informacion del mouse
    cmp bx,0
    je bucle
    cmp bx,1
    je pinta
    cmp bx,2
    je fin
    jmp bucle
pinta:  
        mov x,cx
        mov y,dx
        
        posicion x; toma posicion del mouse
        mov px,al
        posicion y ; toma pos del mouse
        mov py,al
        inc py
        ventana py,px,py,px,40H
        jmp bucle
FIN:
.EXIT
MAIN ENDP
READ PROC
   MOV AH,01H
   INT 21H
   RET
READ ENDP
END MAIN
