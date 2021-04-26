.model small
.stack 100h  

.data

gcd db 1

.code 
main proc
    mov ax, @data
    mov ds,ax
    
    mov al,33
    mov bl,22
    
    loop_star:
    cmp al,bl
    je gcd_found
    jg cond1
    sub bl,al
    jmp loop_star
    
    cond1:
    sub al,bl
    jmp loop_star
    
    gcd_found:
    mov gcd,al
    
    
    main endp
end main
