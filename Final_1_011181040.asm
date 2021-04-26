.model small
.stack 100h

.data 


.code     


permutation proc 
    
    
                                 
    
    
permutation endp   


factorial proc
    
    mov ax,1
    TOP:
    mul cx
    loop TOP
    ret             
                
factorial endp






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


outdec proc 
    
    push ax
    mov dl, 0
    mov ah,1
    int 21h
    
    outdec_loop:
    cmp al, 0Dh
    je exit_outdec_loop
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
    jmp outdec_loop
    
    exit_outec_loop:
    pop ax
    ret
    
    
outdec endp



main proc
    
   
       
main endp  





end main
    
    