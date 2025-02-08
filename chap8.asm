                   
;converts hexadecimal to decimal

.model small 
.stack 200h

.data
      instruction db "Enter a hex from '0' to 'F': $"
      msg_easy db 0dh, 0ah, "In decimal it is: $" 
      msg_hard db 0dh, 0ah, "In decimal it is: 1$"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah, 09h
    lea dx, instruction
    int 21h
    
    mov ah, 01h
    int 21h
    
    cmp al, '0'
    jl compifchar
    cmp al, '9'
    jg compifchar
    
    jmp printEasy
     
    compifchar:
        cmp al, 'A'
        jl end_prog
        cmp al, 'F'
        jg end_prog
        jmp printComplex
        
    printComplex:
        sub al, 41h
        add al, '0'
        ;mov ah, 09h
       ; lea dx, msg_hard
        ;int 21h  
        jmp print_val
        
    printEasy:
      ;  mov ah, 09h
       ; lea dx, msg_easy
        ;int 21h 

        jmp print_val
      
    print_val:

        
        mov ah, 02h
        mov dl, al
        int 21h
        jmp end_prog
    
    
    end_prog:
    mov ah,4ch
    int 21h
main endp
end main




