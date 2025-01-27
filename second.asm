.model small   
.stack 100h    

.data  
    print db 'Enter a char: $'
    input db ?          

.code
main proc
    mov ax, @data 
    mov ds, ax
    
    mov ah, 09h       
    lea dx, print     
    int 21h           
    
    mov ah, 01h
    int 21h
    
    mov ah, 02h
    lea dl, al
    int 21h

main endp
