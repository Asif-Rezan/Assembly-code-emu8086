.model small
.stack 100h

.data


.code
main proc
    
    ;0111 1111b= 7Fh
    ;mov al, 11000011b; 0C3h
    ;and al, 7fh ; al and 7fh 
    
    mov al, 01000010b ; 42h
    or al, 81h         ; 1000 0001b= 81h
    
    xor dx, 8000h ;1000
    
    
main endp
end main