name "Programa menu"



org 100h

;programa uno, entrada 
    
    
    
    .data

centenas         db 30h
decenas          db 31h
unidades         db 35h
entrada          dw 0
                         
salida           dw 999

salidacentena    db 0
salidadecena     db 0
salidaunidad     db 0

operando1        dw 00AAh
operando2        dw 0055h
resultado        dw 0
opcion           db 1



    .code     



  
;Inicio de saltos 


        mov ah,01h
        int 21h
        
        sub al,30h


   
    
;    call ASCII2BIN
;    mov ax, entrada
    mov opcion,al
    
    
    
    
    mov Al, opcion
    mov Cl,1
    cmp Al,Cl
    JZ tarea1
    
    mov Cl,2
    cmp Al,Cl
    JZ tarea2
    
    
    tarea3: mov ax,operando2
            sub ax,operando1
            mov resultado, ax
            jmp fin
            
    tarea2: mov ax, operando2
            sub ax, operando1
            mov resultado, ax
            jmp fin
    
    tarea1: 
            call ASCII2BIN
            mov ax,operando1
            call ASCII2BIN
            add ax, entrada
            mov resultado, ax
             
            
      
            
    fin: hlt
;Fin      




;Inicio de conversion salida a tres digitos ASCII


BIN2ASCII:
    mov AX,salida
    mov Cl,64h
    div Cl    
    add Al,30h
        
    mov salidacentena,al
    mov Al,Ah
    and Ax,00ffh
        
    mov Cl,0ah
    div Cl
    add Al,30h
    add Ah,30h
    mov salidadecena,Al
    mov salidaunidad,Ah   
    ret
    
;Fin ASCII



;Inicia conversion de 3 digitos a registro "entrada"


ASCII2BIN:  

    mov ah,01h     ;operacion 21 
    int 21h        ;entrada desde teclado
    
;    mov Al, centenas
    sub Al,30h
    mov Cl,64h
    mul Cl
    mov entrada, AX 
    
    mov ah,01h     ;operacion 21 
    int 21h
    
;    mov Al,decenas
    sub Al,30h
    mov Cl,0ah
    mul Cl 
    add entrada, AX 
    
    mov ah,01h     ;operacion 21 
    int 21h
    
;    mov Al,unidades
    sub Al,30h 
    
    add entrada, AX
    ret
     

;Fin del bloque de entrada


end