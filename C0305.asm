include macros.lib

SUMAR MACRO
      GOTOXY 35,6
      WRITE L1
      CALL READ 
      MOV N1,AL
      
      GOTOXY 35,7
      WRITE L2
      CALL READ
      ADD N1,AL
      SUB N1,30H
      GOTOXY 35,8
      WRITE L3
      WRITE N1
ENDM
      
RESTAR MACRO
      GOTOXY 35,6
      WRITE L1
      CALL READ 
      MOV N1,AL
      
      GOTOXY 35,7
      WRITE L2
      
      JMP LEE
      PRINT:
      GOTOXY 35,7
      WRITE L4
      
      LEE:
      CALL READ
      CMP N1,AL
      JB PRINT
      
      SUB N1,AL
      ADD N1,30H
      GOTOXY 35,8
      WRITE L3
      WRITE N1
ENDM

NOMBRES MACRO
    GOTOXY 35,6
    WRITE L5
    MOV SI,0
    NC1:  
    CALL READ
    CMP AL,0DH
    JE NA
    MOV VALOR[SI], AL
    ADD SI,1
    CMP SI,20
    JNE NC1

    NA:
    GOTOXY 35,7
    WRITE L6
    WRITE VALOR
ENDM
 
.MODEL SMALL

.STACK 64

.DATA

    L1    DB 'INGRESA NUMERO 1: ','$'
    L2    DB 'INGRESA NUMERO 2: ','$'    
    L3    DB 'EL RESULTADO ES: ','$'
    L4    DB 'NUMERO MAYOR INGRESA UNO MENOR: ','$'
    L5    DB 'INGRESA NOMBRE: ','$'
    L6    DB 'EL NOMBRE ES: ','$'
    L7    DB 'PRESIONA UNA TECLA PARA CONTINUAR... $'

    MENU    DB 'MENU','$'
    SUMA    DB '1.-SUMA','$'
    RESTA   DB '2.-RESTA','$'
    NOMBRE  DB '3.-NOMBRE','$'
    SALIR   DB '4.-SALIR','$'
    LN      DB 0AH,0DH,'$'
    
    OPCION  DB 0
    N1      DB 0,'$'
    N2      DB 0,'$'
    RE      DB 0,'$'
    VALOR   DB 20 DUP(?),'$'
.CODE

MAIN PROC FAR
    MOV AX, @DATA    
    MOV DS,AX   


    WHILE_1:
    CLEAR

    GOTOXY 35,0
    WRITE MENU
    GOTOXY 35,1
    WRITE SUMA
    GOTOXY 35,2
    WRITE RESTA
    GOTOXY 35,3
    WRITE NOMBRE
    GOTOXY 35,4
    WRITE SALIR
    GOTOXY 35,5
    CALL READ
    MOV OPCION,AL
    
    SUB OPCION,30H
    
    CMP OPCION,1
    JNE NEXT1
    SUMAR
    
    NEXT1:
    CMP OPCION,2
    JNE NEXT2
    RESTAR
    
    NEXT2:
    CMP OPCION,3
    JNE NEXT3
    NOMBRES
    
    NEXT3:
    CMP OPCION,4
    JE FIN
    
    GOTOXY 35,8
    WRITE L7
    CALL READ
    
    JMP WHILE_1
    
    FIN:
    .EXIT
MAIN ENDP

READ PROC
    MOV AH,01H
    INT 21H
    RET
READ ENDP

END MAIN