.model small
.stack 100h

.data   

.code
main proc 
    mov cx, 0
    mov ah,1
    int 21h
    
    
    check_newline:
    cmp al, 0Dh
    je start_print
    
    push ax
    inc cx
    mov ah,1
    int 21h
    jmp check_newline
    
    start_print:
    mov ah,2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    jcxz exit
    
    main_print:
    pop ax
    mov ah,2
    mov dl,al
    int 21h
    loop main_print
    
    exit:  
   
    
main endp
end main
    
    
    
