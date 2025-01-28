
; displays 'o' if 1 or 3 entered or 'e' if 2 or 4 entered

.model small
.stack 200h

.data
    instruction db "Enter a number between 1 to 4: $"
    odd_print db 0dh, 0ah, "o$"
    even_print db 0dh, 0ah, "e$"

.code    
main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, instruction
    int 21h
    
    mov ah, 01h
    int 21h
   
    ;compare 
    
    ;checking a valid input
    cmp al, '1'
    jl end_prog
    cmp al, '4'
    jg end_prog
     
    ;comapring if odd
    cmp al, '1'
    je odd
    cmp al, '3'
    je odd  
       
    ;comparing if even
    cmp al, '2'
    je even
    cmp al, '4'
    je even
 
    odd:
        mov ah, 09h
        lea dx, odd_print
        int 21h
        jmp end_prog
    
    even:
        mov ah, 09h
        lea dx, even_print
        int 21h
        jmp end_prog
        
    
    ;termination 
    end_prog:
        mov ah, 4ch
        int 21h    
        
        
main endp
end main