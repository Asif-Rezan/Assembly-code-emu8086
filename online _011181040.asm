.model small
.stack 100h

.data 


.code


indec proc 
    
    push ax
    mov dl, 0
    mov ah,1
    int 21h
    
    indec_loop:
    cmp al, 0Dh
    je exit_indec_loop
    inc ch
    
    sub al,48
    push ax
    mov al,10
    mul dl
    mov dl,al
    pop ax
    add dl, al   
    
    mov ah,1
    int 21h
    jmp indec_loop
    
    exit_indec_loop:
    pop ax
    ret
    
    
indec endp



main proc
    
    call indec 
    
    call calculate_sum  
    
    
    show_result:
    mov ah,2
    mov dl, 0ah
    int 21h
    mov dl, bl
    int 21h
    jcxz exit
    
    
    exit:
    
    
    mov ah, 4ch
    int 21h
       
main endp  


calculate_sum proc  
     
     
     pop ax
     mov bl,al
     add bl,al 
     
     ret              
                   
                   
calculate_sum endp  


end main
    
    