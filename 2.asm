.model small
.stack 100h

.data  
a db 'Armstrong Number'
b db 'Not Armstrong Number' 

.code

main proc 
    call indec
    mov cl,al 
    
    call armstrong_number
     
    
    mov ah,4ch
    int 21h
    
   
    
main endp 

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
            
            
   
            

armstrong_number proc  
    
    add bl,cl
    ret
        
    
armstrong_number endp  




calculate_cube proc   
    
    pop ax
    mov cl, al
    mul cl  
    
    ret
    
calculate_cube endp   



   
   
   

end main