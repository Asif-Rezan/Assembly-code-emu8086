.model small
.stack 100h

.data

.code

main proc 
    
    mov dx,0 ;foe keeping the count of read characters
    
    mov ah,1
    int 21h   
    
    check_newline:
    cmp al,0Dh ;check if the input is equal to carriage return
    je exit
    inc dx
    
    mov ah,1
    int 21h
    jmp check_newline
    
    exit:
    
    main endp
end  main