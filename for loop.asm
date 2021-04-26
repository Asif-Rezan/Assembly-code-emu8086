.model small
.stack 100h

.data
.code

main proc
    mov cx, 1  
    
    
    jcxz skip_loop
    
    print_star:
    mov ah,2
    mov dl, '*'
    int 21h
    
    loop print_star   
    
    skip_loop:
    
    main endp
end main