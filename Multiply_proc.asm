.model small
.stack 100h

.data

.code

main proc
    
    mov al,5
    mov bl,3
    
    call multiply
    
    mov ah, 4ch
    int 21h 
    
      
    
    
main endp   


; multiplicant will be in al, multiplayer will be in bl
;result will be in cl

multiply proc
       
       
      push dx
        
      mov cl,0
      mov dl,1  
      
      multiply_loop:
      cmp dl,bl
      jg exit_loop  
      add cl,al  ;cl+al=result+multiplicant    
      inc dl
      jmp multiply_loop
      
      exit_loop:  
      pop dx
      ret  
      
    
    
multiply endp



end main