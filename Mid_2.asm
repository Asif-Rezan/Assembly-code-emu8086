.model small
.stack 100h


.data 
n db 1
multiplier db 3  
i db 0
result db 0 
final_result db 0
j db 2

.code

main proc
    
    mov ax, @data
    mov ds,ax
      
    
    ;user input in n variable
    mov ah,1
    int 21h
    sub al,48
    mov n,al 
    
    
    
    cond_loop:
    
    mov bl, i
        
    cmp n,bl
    jg task 
    jmp task2
    
    
    
    
    task:
    mov cl, result
    add cl,i
    inc i
    jmp cond_loop 
    
    
    task2:
    sub cl,2 
    
    
    
    
    loop_sqr:
      
    cmp cl,j
    jg task3
    jmp show_result
      
    
    task3:
    add cl,2
    inc j
    jmp loop_sqr
    
    
    show_result: 
    
    mov final_result,cl  
    
    
    
    exit:
    
     
     
    
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
main endp
end main