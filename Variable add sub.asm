.model small
.stack 100h


.data
a db 35 ; db= define byte, 0-225   

b dw 300D ; dw= define word, 0-2^16-1

C db 101B 

D dw 3FAH

E db 0FFH

F db 'A' ; 'A' ascii code 65

G db "b"
   

B_ARRAY db 10h, 20h, 30h, 40h, 50h  
letters db 'ABC'


.code
main proc ;proc= procedure
    MOV AX, @DATA
    MOV DS, AX
    
    ;MOV AX, D ; AX = D  
    
    ;MOV bx, d
    ;mov b, bx
    ;mov cl, c 
    
    ;xchg ax, b  ; temp=ax; ax=b; b=temp    
    
    MOV AH,35
    MOV BH,50
    
    ;ADD AH, BH  ; AH= AH+BH
    
    ;SUB BH, AH ;BH= BH-AH 
    
    ADD AH, 2 ; AH=AH+2
    ADD a, 4
    
    ;INC AH ;AH++
    ;DEC BH ;BH-- 
    
    NEG BH ; BH= -BH 
    
    
main endp
end main








