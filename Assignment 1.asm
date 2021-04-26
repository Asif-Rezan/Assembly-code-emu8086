.model small
.stack 100h

.data

num1 db 0Ah, 0Dh, 'Enter the firls number:$'   
num2 db 0Ah, 0Dh, 'Enter the second number:$'
num3 db 0Ah, 0Dh, 'Enter the third number:$'
num4 db 0Ah, 0Dh, 'Enter the fourth number:$'
num5 db 0Ah, 0Dh, 'Enter the fifth number:$'

print1 db 0Ah, 0Dh, 'Sum is in range 1$'
print2 db 0Ah, 0Dh, 'Sum is in range 2$'

.code
main proc
    MOV ax, @DATA
    MOV ds,ax
    
    Enter_Num1:
    mov ah,9
    lea dx,num1
    int 21h
    
    mov ah,1
    int 21h 
    ;sub al,30h 
    sub al,48
    mov dl,al
    
    
    Enter_number2:
    lea dx,num2
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    ;sub al,30h 
    sub al,48
    mov cl,al 
    
    
    Enter_number3:
    lea dx,num3
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    ;sub al,30h
    sub al,48  
    mov dh,al  
    
    Enter_number4:
    lea dx,num4
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    ;sub al,30h 
    sub al,48 
    mov bh,al 
    
    Enter_number5:
    lea dx,num5
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    ;sub al,30h
    sub al,48  
    mov bl,al
    
      ;-48
     
    add ch, dl
    add ch, cl
    add ch, dh
    add ch, bh
    add ch, bl
    ;add ch,30h
    
    CMP1:
    cmp ch, 0
    jge CMP2
    jmp exit  
    
    CMP2:
    cmp ch, 5
    jnl print_in_range1
    jmp COM3
    
    
    COM3: 
    cmp ch,40
    jnl print_in_range1
    jmp print_in_range2
    
    
    
    print_in_range1:
    mov ah, 9
    lea dx, print1
    int 21h
    jmp exit 
    
    
    print_in_range2: 
    mov ah, 9
    lea dx, print2
    int 21h 
     
    
    exit:
    
main endp
end main
      
      
    
    
    
    
    
   
   
    
    
     
    
    
    
    
    
    
    