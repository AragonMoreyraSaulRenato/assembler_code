
TITLE 
.286
.model small;
.stack 64;
.DATA

      let1 DB 'Hola primer programa en ensamblador'
      ;//tam_let = $-let1 ;//listo
      tam_let equ $-let1  ;// listo
      salto db 0dh,0ah,'$'
      .CODE
      main proc far
      
      mov ax,@DATA
      mov ds,ax
      
     
      MOV AH, 40H
      mov bx,0001h
      mov cx,tam_let
      lea dx,Let1
      int 21h
      
      ;// salto de linea
      lea dx,salto
      mov ah,09h
      int 21h
      
      ;// imprimir valor de cx
      mov ah,02h  ;// interrupcion para imprimir un caracter
      mov dl,cl 
      add dl,30h  ;// Para imprimir el numero y no simbolo
      int 21h
      
     
     .exit
      
      MAIN ENDP

      END MAIN
