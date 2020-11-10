include MACROS.lib
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
    mov arre[si],20h ; muevo al ?ltimo de la cadena un espacio
endm
.MODEL SMALL ;DECLARACION DEL MODELO DE MEMORIA
.STACK 64
.DATA
    cad1 db 50 dup (?),"$"
    cad2 db 50 dup (?),"$"
    tam dw ?,"$"
    let1 db "Es subcadena $"
    let2 db "No es subcadena $"
    LN DB 0AH,0DH,'$'
    salto db 0DH,'$' 
    
.CODE
MAIN PROC FAR
    MOV AX, @DATA  
    MOV DS,AX
    MOV ES,AX
    
    leern cad1
    ;mover tama?o de cadena;
    mov tam, si
    leern cad2
    mov si,0;posicionar si en 0
    mov di,0
ciclo:
    cld
    mov cx,tam
    cld
    mov al,cad2[si]
    lea di,cad1[di]
    
    repne scasb
    jne no
    inc si
    cmp cad2[si],20h ; si cadena2 es igual a espacio entoncces termina
    jne ciclo
    write let1
    jmp fin
no:
    write let2
    
FIN:
.EXIT
        
MAIN ENDP
READ PROC
   MOV AH,01H
   INT 21H
   RET
READ ENDP
END MAIN
