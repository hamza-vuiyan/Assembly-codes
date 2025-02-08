
; count the character in input line

.model small
.stack 200h

.data
    instruction db "Enter your text: $"
    print db 0dh, 0ah, "Number of Char is: $"
    
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, instruction
    int 21h
    
    mov cx, 0      ; using 'cx' as counter and initializing with value 0
    
    
    jmp take_char   
    
    take_char:
        mov ah, 01h
        int 21h
        cmp al, 0dh
        je end_prog 
        inc cx
        jmp take_char
      
     
    ;termination
    
    end_prog:
        ;printing the counter
        mov ah, 09h
        lea dx, print
        int 21h
        
        add cl, '0'  ;cl only have numeric 1/2/3 to print it we need it's ASCII value 1h+30h('0') = 31h = 1
        mov dl, cl   ;becuse dos 02h always prints from lower dx or 'dl'
        mov ah, 02h
        int 21h
        
        ;termiantion
        mov ah, 4ch
        int 21h
    
main endp
end main