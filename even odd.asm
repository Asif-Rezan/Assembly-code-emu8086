.model small
.stack 100h

.data  

even db 'The number is even$'
odd db 'The number is odd$'

.code
main proc 
    mov ax,@data
    mov ds,ax
    
    mov al,10
    
    and al,01h ;0000 0001b
    
    cmp al,0
    je print_even
    
    mov ah,9
    lea dx, odd
    int 21h
    jmp exit
    
    print_even:
    mov ah,9
    lea dx,even
    int 21h
    
    exit:
    
    main endp
end main
    
             