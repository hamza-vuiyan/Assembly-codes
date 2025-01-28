

; reads a character if it's 'y' or 'Y' displays it

.model small
.stack 200h

.data 
    instruction db "Enter a character: $"


.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, instruction
    int 21h
    
    mov ah, 01h
    int 21h
    
    cmp al, 'y'
    je print 
      
    cmp al, 'Y'
    je print
   
    jmp end_prog
    
    print:
        mov ah, 02h
        mov dl, al
        int 21h
        jmp end_prog
    
    
    ;termination
    end_prog:
        mov ah, 4ch
        int   21h
    
main endp
end main