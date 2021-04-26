.model small
.stack 100h

.data            
msg db 'hello$'
msg1 db 0ah, 0dh,'world$'

.code
main proc 
    mov ax, @data
    mov ds, ax
    
   ; mov ah,1
   ; int 21h
    
   ; mov bl,al
    
   ; int 21h
   
   ;mov ah,1
   ;int 21h
   
   ;sub al,48 
    
    
   
   ;mov ah,2
   ;mov dl, 'a'
   ;int 21h  
   
   ;mov dl, 'c'
   ;int 21h  
   
   ;mov dl, 0Ah  
   ;int 21h
   
   ;mov dl, 0Dh
   ;int 21h
   
   ;mov dl, 'b'
   ;int 21h 
   
   
           
   mov ah,9
   lea dx,msg
   int 21h 
   
   lea dx, msg1
   int 21h       
           
    
main endp
end main
