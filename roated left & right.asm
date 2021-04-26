.model small
.stack 100h

.data

.code
main proc 
           
   ;roated right         
   mov dl, 0F4h  
   ror dl,1
   
   
   ;roated left
   mov bl,0A2h
   rol bl,1 
   
   
   ;roated carry left
   rcl bl,1
   
   
   ;roated carry right
   rcr bl,1 
   
   
   
   
   
    
    main endp
end main
       