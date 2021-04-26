.model small
.stack 100h

.data

a db 0Ah, 0Dh, 'Sum is in range 1$'
b db 0Ah, 0Dh, 'Sum is in range 2$'

.code
main proc
    MOV ax, @DATA
    MOV ds,ax
    
    
    
    mov ah,1
    int 21h 
    sub al,48
    mov bh,al    
    
    
    mov ah,1
    int 21h
    sub al,48
    mov bl,al 
    
    
    
    mov ah,1
    int 21h
    sub al,48  
    mov ch,al  
    
    
   
    mov ah,1
    int 21h
    sub al,48 
    mov cl,al 
    
   
    
    mov ah,1
    int 21h
    sub al,48  
    mov dh,al
    
     
    add ch, bh
    add ch, bl
    add ch, ch
    add ch, cl
    add ch, dl
    
  
    
    exit:
    
main endp
end main
      
      
    
    
    
    
    
   
   
    
    
     
    
    
    
    
    
    
    