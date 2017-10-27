name "uno"



org 100h


;programa uno, entrada 
    
    
    
    .data 
centenas         db 34h
decenas          db 35h
unidades         db 36h
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

;Inicia conversion de 3 digitos a registro "entrada" 





    mov Al, centenas
    sub Al,30h
    mov Cl,64h
    mul Cl
    mov entrada, AX
    
    mov Al,decenas
    sub Al,30h
    mov Cl,0ah
    mul Cl 
    add entrada, AX
    
    mov Al,unidades
    sub Al,30h
    add entrada, AX 
    
    
    
    

;Fin del bloque de entrada




  

;Inicio de converision de tres digitos a ASCII  




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
    
    
    
    
     
;Fin ASCII
  
  
  
  
  
  
  
  
  
  
  
;Inicio de saltos
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
            
    tarea2: mov ax, operando1
            sub ax, operando2
            mov resultado, ax
            jmp fin
    
    tarea1: mov ax,operando1
            add ax,operando2
            mov resultado, ax
            
    fin: nop
;Fin      


end