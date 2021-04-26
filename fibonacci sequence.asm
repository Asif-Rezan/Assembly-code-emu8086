.model small
.stack 100h

.data
n db 10
fib_f db 1
fib_s db 1
fib_t db 1

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov al,3      ;i=al
    
    for_loop_cmp:
    cmp al,n
    jg exit_loop
    mov bl,fib_f
    mov cl,fib_s
    add bl,cl
    mov fib_t,bl
    mov fib_f,cl 
    mov fib_s,bl
    inc al
    
    jmp for_loop_cmp
    
    exit_loop:
    
    