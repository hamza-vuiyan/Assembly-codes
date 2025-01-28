.model small
.stack 200h

.data
    instruction db "Enter any Character: $"
    output db 0dh, 0ah, "You have entered: $"
    
main proc
    ; loading data segment
    mov ax, @data
    mov ds, ax
    
    ; print instruction message
    mov ah, 09h
    lea dx, instruction
    int 21h
    
    ; input   
    mov ah, 01h        ; takes the input and moves to 'al' register automatically
    int 21h
    
    ; print output message (with the $ to terminate string)
    mov ah, 09h
    lea dx, output
    int 21h
    
    ; print the entered character
    mov ah, 02h        ; DOS service to print a character
    mov dl, al         ; Load the input character into DL for output
    int 21h
           
    ; termination       
    mov ah, 4Ch
    int 21h
    
main endp   
end main
