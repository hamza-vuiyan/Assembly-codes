.model small   ; //only have one data segment and one code segment in small model
.stack 100h    ; //defining the stack size, max 64kb for each .stack and 100h means 256bytes

.data  ; //contains all the variables
    print db 'Enter a char: $'
    input db ?          ; //? means nothing initilized in input variable

.code
main:
    ; Initialize data segment
    mov bx, @data ; //Loading the address of .data segment not the variables in data segment
    mov ds, bx

    ; Display prompt
    mov ah, 09h        ; DOS service to print string
    lea dx, print     ; Load the address of the prompt string
    int 21h            ; Call DOS interrupt  
    
    mov ah, 01h
    int 21h
    
    mov input, al
    
    mov ah, 02h
    lea dl, al
    int 21h

end main
