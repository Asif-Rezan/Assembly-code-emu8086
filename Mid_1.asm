.model small
.stack 100h

.data
multiplicand db 12
multiplier db 5
result db 0 
i db 0

final_result db 0


.code
main proc
    MOV ax, @DATA
    MOV ds,ax
    
    cond_loop:
    
    mov bl, multiplier
    
    cmp i,bl
    jg task 
    jmp show_result
    
    
    
    
    task:
    mov cl, result
    add cl,multiplicand
    inc i
    jmp cond_loop
    
    show_result:
    mov final_result, cl  
    
    
    exit:
    
    
    
    
     
    
    
     
    
    
    main endp
end main
       