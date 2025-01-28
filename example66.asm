
; reads a character displays if it's a uppercase

.model small
.stack 200h

.data
    instruction db "Enter a charcter: $"
    
.code
main proc
         mov ax, @data
         mov ds, ax
         
         mov ah, 09h
         lea dx, instruction
         int 21h
         
         
         mov ah, 01h
         int 21h
         
         cmp al, 'A'
         jnge end_prog;  ;jump if not greater or eqal to 'A'
         
         cmp al, 'Z'
         jnle end_prog  ;jump if not less or eqal to 'Z' 
         
         ;displays if above condition is false
         
         mov ah, 02h
         mov dl, al
         int 21h
         jmp end_prog
         
         
        ;termination
        end_prog:
            mov ah, 4ch
            int 21h
    
main endp
end main