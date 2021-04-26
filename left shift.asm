.model small
.stack 100h

.data

.code
main proc 
    mov al,5
    
    mov cl,3
    
    shl al, cl
    
    main endp
end main
       