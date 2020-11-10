include macro1.lib
.286
.model small ;declaracion del modelo de memoria

.stack 64
.data
    arre DB 20 DUP(?),'$'               ;arreglo para el nombre 
    menu db 'Menu',0AH,'$'
    suma db '|1. Suma  |',0AH,'$'
    resta db '|2. Resta |',0AH,'$'
    nombre db '|3. Nombre|',0AH,'$'
    salir db '|4. Salir |',0AH,'$'
    back db 'Pulsa una tecla para regresar','$'
    validar db 'El subtraendo es mayor que el minuendo','$'
    namee db 'Nombre: ','$'
    l1 db 'Ingrese primer valor: ','$'   
    l2 db 'Ingrese segudo valor: ','$'
    l3 db 'Ingresa nombre: ','$'
    opcion db 1 dup (?),'$' 
    resul db 'Resultado: ','$'
    a db (?),'$'                        ;resultado de suma o resta
    ln db 0AH,0DH,'$'
    vacio db 1 dup(' '),"$"
    salto db 0DH,'$'
    cordX db 0,'$'
    cordY db 0,'$'
    
.code
Main proc far
    MOV AX, @data  
    mov ds,ax
switch:
    clrscrn 13h 
    ;inicia el mouse
    mouse 00h
    ;muestra el cursor
    mouse 01h 
    ;iniciar el menu
    gotoxy 35,0 ;posicionar cursor
    write menu
    gotoxy 31,1
    write suma
    gotoxy 31,2
    write resta
    gotoxy 31,3
    write nombre
    gotoxy 31,4
    write salir
    gotoxy 31,5
    ;preciona primero el mouse  :v
bucle:
    mouse 03
    cmp bx,1
    je iz
    jmp bucle
iz:
    ;obtener columna 
    mov ax,cx
    mov bl,8
    div bl
    mov cordX,al
    cmp cordX,31
    jb bucle
    cmp cordx,41
    ja bucle
    ;obtener la fila
    mov ax,dx
    mov bl,8
    div bl
    mov cordY,al
    cmp cordY,1
    jne rest
    sumita
rest:
    cmp cordY,2
    jne nombrecito
    restita
nombrecito:
    cmp cordY,3
    jne saliir
    nombree arre
    cleanarre arre
saliir:
    cmp cordY,4
    je breakk
    write ln
    write back
    call read
    jmp switch
breakk:
.exit
main ENDP

read proc
   mov ah,01h
   int 21h
   ret
read endp
END main
      