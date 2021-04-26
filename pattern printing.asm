.model small
.stack 100h


.data
n db 5



.code
main proc
    mov ax, @data
    mov ds,ax
    
    ;user input in n variable
    mov ah,1
    int 21h
    sub al,48
    mov n,al  
    
    ;print new line
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    
    mov bl,1 ;for tracking current line number
    
    outer_loop:
    cmp bl,n
    jg exit
    
    mov cl,bl
    mov ch,0
    print_star:
    mov ah,2
    mov dl, '*'
    int 21h
    loop print_star
    
    ;print new line
    mov ah,2
    mov dl,0Ah
    int 21h
    mov dl,0Dh
    int 21h
    
    
    inc bl
    jmp outer_loop 
    
    exit:
    
    
    
main endp
end main
    
    