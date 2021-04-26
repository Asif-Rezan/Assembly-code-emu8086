.model small
.stack 100h

.data

.code
         
         
         
main proc 
    mov ax,5
    mov bx,6  
    call multiply  
    
    push dx
    
    mov ah, 4ch
    int 21h
    
;main endp
 
 
 
 
;input: multiplicand =ax, multiplier=bx
; output: dx= result
 

multiply proc    
    
    mov dx,0
    mov cx, bx
    
    
    start_loop:
    add dx,ax
    loop start_loop
    
    
    ret
    
    
;multiply endp 



;end main