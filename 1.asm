.model small
.stack 100h

.data 

a db 'Brackets Matched'
b db 'Brackets Not Matched'  

.code
main proc  
    MOV AX, @DATA
    MOV DS, AX
    
    mov cx, 0
    mov ah,1
    int 21h  
    
    
    
    check_newline:
    cmp al, 0Dh
    je check_match 
    
    cmp al, 28h            ; ( 28h   ) 29h
    je store_stack  
    
    cmp al, 29h
    je check
    
    
    store_stack:   
    push ax 
    inc dx
    inc cx
    mov ah,1
    int 21h
    jmp check_newline  
    
    
    check:
    pop ax 
    inc bx
    mov al, bl
    cmp al,bl
    je print_match
    
    
    
    
    
    check_match:
    cmp bx,dx
    je print_match 
    
    mov ah, 9
    lea dx, b
    int 21h 
    
    
    print_match:
    mov ah, 9
    lea dx, a
    int 21h 
    
   
 
    
    exit:  
   
    
main endp
end main
    
    
    
