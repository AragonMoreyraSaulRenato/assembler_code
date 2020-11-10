;en un ciclo
;1. leer una cadena
;2. leer un caracter
; ilumniar la cadena en el caracter
;4decir cu?ntas veces aparcere el caracter en la cadena
;5 salir si no vuelve a repetir pero solo con otro caracter
include macro.lib
.286

leern macro arre
    LOCAL LEER, SALIRR
    mov si,0
leer:
    call read
    cmp al,salto
    je salirr
    mov arre[si],al
    inc si
    jmp leer
salirr:
endm

resalta macro col
    mov ah,06h
    mov al,01h
    mov bh,57h
    mov ch,1
    mov cl,col
    mov dh,1
    mov dl, col
    int 10h
endm

.MODEL SMALL ;DECLARACION DEL MODELO DE MEMORIA
.STACK 64
.DATA
    nombre db 50 DUP (?), '$'
    char db ?,"$"
    pos dw ?,"$"
    letpos dw ?,"$"
    tam dw ?,"$"
    cont db ?,"$"
    let1 db "Dame cadena: $"
    let2 db "dame caracter: $"
    let3 db "no se encuentra. $"
    LN DB 0AH,0DH,'$'
    salto db 0DH,'$'
       
.CODE
MAIN PROC FAR
    MOV AX, @DATA  
    MOV DS,AX
    MOV ES,AX
    clrscrn 13h
buclem:
    mouse 03 ;obtener informacion del mouse
    cmp bx,1
    je bucle
    jmp buclem
bucle:
    write let1
    write ln
    leern nombre
    
    mov tam,si

    write let2
    read_c char
    
    write ln
    ;write char
     mov di,0
ciclo:
    CLD
    
    mov cx,tam
    mov al,char
    lea di,nombre[di]
    repne scasb
    jne no
    mov pos,di
    add pos,30h
    mov bx,di
    mov cont,bl
    dec cont
    RESALTA cont
    write pos
    write ln
    ;add cont,30h
    ;write cont
    ;write ln
    cmp di,tam
    jb ciclo
    jmp fin
no:
    write let3
    jmp fin    
FIN:
.EXIT
        
MAIN ENDP
READ PROC
   MOV AH,01H
   INT 21H
   RET
READ ENDP
END MAIN