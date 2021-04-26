.model small
.stack 100h

.data
ax_g db 'ax is grater$'
bx_g db 'bx is gratter$'

.code
main proc  
    mov ax, @data
    mov ds, ax
    
    mov ax,5
    mov bx,8
    
    cmp ax, bx
    jg print_ax  ;jump if grater than
    
    mov ah, 9
    lea dx, bx_g
    int 21h   
    jmp exit     ; jmp is unconditional jump
    
    
    print_ax:
    mov ah,9
    lea dx, ax_g
    int 21h 
    
    exit:
    
    main endp
end main
    