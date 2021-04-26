.MODEL SMALL
.STACK 100h
.DATA        
    ARR DB 50 DUP(?) ; declare array with null value initially 
     str2 db 'How many number you want to store(1-9):$'
     str1 db '\nEnter values(without press enter or space):$' 
     str3 db 'Sum of even index values:$'
                
.CODE                                            
   indec proc
; reads a number in range -32768 to 32767
;input: none
; output: AX • binary equivalent of number


    push bx ; save registers used
    push cx
    push dx
    
    ;print prompt
    begin:
        mov ah,2
        mov dl,10
        int 21h  
        mov dl,13
        int 21h

;total=0
    mov bx,0   ;bx holds total
                               
;negative=false
        mov cx,0
;read a character
        mov ah,1
        int 21h
        ;case character of
    cmp al,'-'
    je minus
    cmp al,'+'
    je plus
    jmp repeat2 
    
    minus:
        mov cx,1
    plus:
        int 21h
    ;endcase
    repeat2:
    ;if character is between 'O' and '9'

        cmp al,'0'      ;character >a '0'?
        
        jnge notdigit    ;illegal character
        cmp al,'9'
        jnle notdigit    ;no, illegal character
    
    ; then convert character to, a digit   
    
    and ax,00fh ;convert to digit
    push ax ;save on stack
    ;total = total x 10 + digit
    
    mov ax,10   ;get 10
    mul bx      ;AX= total x 10
    pop bx      ; retrieve digit
    add bx,ax      ;total=total x 10 + digit 
  ;read a character 
  
    mov ah,1  
    int 21h   
    cmp al,0dh
    jne repeat2 
 ;until cr
    mov ax,bx      ;store number in AX
    
 ;if negative
    cmp cx,0    ;negative number
    
    je exit        ;no, exit   
    
;then   
    neg ax          ;yes negate 
    
;endif   

exit:
    pop dx        ;restore registers
    pop cx
    pop bx
    ret 
 ;here if illegal character entered
 notdigit:
    mov ah,2
    mov dl,0dh
    int 21h 
    mov dl,0ah
    int 21h

    jmp begin       ;go to begining
    
 indec endp


outdec proc
    ;prints AX as a signed decimal integer
   ;input: AX
 ;output: none
    push  ax
    push  bx
    push  cx
    push  dx 
    
 ;if AX"< 0
    or ax,bx
    jge endif1
 ;then
     push ax
     mov dl,'-'
     mov ah,2
     int 21h
     pop ax
     neg ax
     
endif1:
;get decimal digits
     xor cx,cx
     mov bx,10d
     
repeat1:
    xor dx,dx
    div bx
    push dx
    inc cx
;until
    or ax,ax
    jne repeat1
;convert digits to characters and print
    mov ah,2

printloop:
    pop dx
    or dl,30h
    int 21h
    loop printloop
    
;endfor
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
        AND AL,0FH ;convert from ascii value to real value
        
        MOV CL,AL
        MOV BL,AL
        MOV SI,0
        
        
        lea dx,str1
        mov ah,9 
         
        
        INPUT: 
        call indec
        ;AND AL,0FH
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