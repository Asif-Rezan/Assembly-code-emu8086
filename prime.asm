.model small
.stack 100h

.data
dividend db 10
divisor db 3 
result db 0    

n db 18
isPrime db 1

.code

main proc
    mov ax, @data
    mov ds,ax  
    
    mov al,2 ;i=al  
    
    loop_comp:
    cmp al,n 
    jge exit:  
    
    
    mov cl,n
    mov dividend,cl
    mov divisor,al
    
    comparison:
    mov bl,divisor
    cmp dividend,bl
    jl result_found
    sub dividend, bl
    inc result
    jmp comparison
    
    result_found: 
    
    cmp dividend, 0 
    je not_prime
    inc al
    jmp loop_comp
    
    not_prime:
    mov isPrime, 0
    jmp exit
     
    
    
    exit:
    
main endp
end main