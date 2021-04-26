.model small
.stack 100h

.data

.code
main proc 
    mov al,53
    
    call isPrime
      
    mov ah,2 
    add dl,48
    int 21h
    
    mov ah, 4ch
    int 21h
    
main endp 


;divident will be in al, divisor will be in bl
;remainder will be in ch
remainder proc 
     push ax
     push bx  
     r_loop:
     cmp al,bl
     jl exit_rem_loop  
     sub al,bl  
     jmp r_loop
     
     exit_rem_loop:    
     mov ch,al
     pop bx
     pop ax
     
     ret
    
    
remainder endp    



; n will be in al
;result will be in dl

isPrime proc 
      push ax  
      push bx
      push cx   
      
      mov cl,2   
      p_loop:
      cmp cl,al
      je exit_p_loop
      
      mov bl,cl
      
      call remainder   
      
      cmp ch,0
      je  not_prime  
      inc cl
      jmp p_loop
      
      
      not_prime:
      mov dl,0  
      
      exit_p_loop:
      pop cx
      pop bx
      pop ax
      ret
      

isprime endp



end main