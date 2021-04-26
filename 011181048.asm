.MODEL SMALL
.STACK 100h
.DATA        
    ARR DB 50 DUP(?)
     str2 db 'How many number you want to store(1-9):$'
     str1 db '\nEnter values(without press enter or space):$' 
     str3 db 'Sum of even index values:$'
                
.CODE                                            
   indec proc



    push bx 
    push cx
    push dx
    
    
    begin:
        mov ah,2
        mov dl,10
        int 21h  
        mov dl,13
        int 21h


    mov bx,0  
                               

        mov cx,0

        mov ah,1
        int 21h
        
    cmp al,'-'
    je minus
    cmp al,'+'
    je plus
    jmp repeat2 
    
    minus:
        mov cx,1
    plus:
        int 21h
   
    repeat2:
    

        cmp al,'0'      
        
        jnge notdigit    
        cmp al,'9'
        jnle notdigit   
    
      
    
    and ax,00fh 
    push ax 
    
    
    mov ax,10   
    mul bx      
    pop bx      
    add bx,ax      
  
    mov ah,1  
    int 21h   
    cmp al,0dh
    jne repeat2 

    mov ax,bx      
    
 
    cmp cx,0    
    
    je exit         
    
   
    neg ax          
       

exit:
    pop dx        
    pop cx
    pop bx
    ret 
 
 notdigit:
    mov ah,2
    mov dl,0dh
    int 21h 
    mov dl,0ah
    int 21h

    jmp begin       
    
 indec endp


outdec proc
  
    push  ax
    push  bx
    push  cx
    push  dx 
    
 
    or ax,bx
    jge endif1
     push ax
     mov dl,'-'
     mov ah,2
     int 21h
     pop ax
     neg ax
     
endif1:

     xor cx,cx
     mov bx,10d
     
repeat1:
    xor dx,dx
    div bx
    push dx
    inc cx

    or ax,ax
    jne repeat1

    mov ah,2

printloop:
    pop dx
    or dl,30h
    int 21h
    loop printloop
    

    pop dx
    pop cx 
    pop bx
    pop ax  
    ret
    
outdec endp



    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        mov BX,0
        mov CX,0
        
        lea dx,str2 
        mov ah,9 
        INT 21H  
        
        MOV AH,1
        INT 21H
        AND AL,0FH 
        
        MOV CL,AL
        MOV BL,AL
        MOV SI,0
        
        
        lea dx,str1
        mov ah,9 
         
        
        INPUT: 
        call indec
        
           MOV ARR[SI],AL
           INC SI
           LOOP INPUT 
           
        
        
        MOV CX,BX
        MOV SI,0
        
        MOV BX,2 
        MOV AX,0
        SUM:
            ADD AL,ARR[SI]
            
            ADD SI,BX
           LOOP SUM
           
        MOV CX,AX  
        mov ah,2
        mov dl,10
        int 21h  
        mov dl,13 
        int 21h
        lea dx,str3
        mov ah,9 
        INT 21H           
        MOV AX,CX
        CALL outdec
        
        
  MAIN ENDP
END MAIN