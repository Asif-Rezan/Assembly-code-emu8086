.model small
.stack 100h

.data 
first db 'First condition is true'
second db 'Second condition is true'

.code

main proc 
    MOV AX, @DATA
    MOV DS, AX
    
    
    mov bl, 1001100b
    
    com1:
    and bl, 01100110b
    jz com3
    jmp com2
            
            
    
    com2:
    and bl, 01100110b
    jz com3
    jmp print_second
    
    
    com3:
    and bl, 00000000
    jz print_first 
    jmp print_second
    
    
    print_first:
    mov ah, 9
    lea dx, first
    int 21h 
    
    print_second:
    mov ah, 9
    lea dx, second
    int 21h  
    
    exit:
    
   
    
    
main endp
end main