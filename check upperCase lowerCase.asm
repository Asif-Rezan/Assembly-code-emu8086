.model small
.stack 100h

.data
low db 0Ah, 0Dh, 'Lowercase$'
upp db 0Ah, 0Dh, 'Uppercase$'

.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    
    CMP1:
    cmp al, 'a'
    jge cmp2
    jmp print_upp
    
    
    CMP2:
    cmp al, 'z'
    jle print_low
    jmp print_upp
    
    print_low:
    mov ah,9
    lea dx, low
    int 21h   
    jmp exit
    
    print_upp:
    mov ah, 9
    lea dx, upp
    int 21h 
    
    exit:
    
    main endp
end main