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

a db 0
b db 0
c db 0
d db 0
e db 0

f db 0

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
    sub al,48
    mov a,al
    
    
    Enter_number2:
    lea dx,num2
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h 
    sub al,48
    mov b,al 
    
    
    Enter_number3:
    lea dx,num3
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48  
    mov c,al  
    
    Enter_number4:
    lea dx,num4
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h 
    sub al,48 
    mov d,al 
    
    Enter_number5:
    lea dx,num5
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,48  
    mov e,al
    
    
    
     
    add ch, a
    add ch, b
    add ch, c
    add ch, d
    add ch, e 
    
    
    
    CMP1: 
    cmp ch,0
    jge CMP2
    jmp exit  
    
    CMP2: 
    cmp ch, 5
    jnl print_in_range1
    jmp COM3
    
    
    COM3:  
    cmp ch,40
    jge print_in_range1
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
      
      
    
    
    
    
    
   
   
    
    
     
    
    
    
    
    
    
    