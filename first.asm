.model small   ; //only have one data segment and one code segment in small model
.stack 100h    ; //defining the stack size, max 64kb for each .stack and 100h means 256bytes

.data  ; //contains all the variables
    message db 'Enter a character: $'

.code
main proc
    ; Initialize data segment
    mov bx, @data ; //Loading the address of .data segment not the variables in data segment
    mov ds, bx

    ; Display prompt
    mov ah, 09h        ; 09h is DOS interrupt function and we must use 'ah' register to store dos function like '09h, 01h'
                          ; 09h to print a string that ends with '$' and works with 'dx' register
    lea dx, message    ; Load the address of the 'message' string
    int 21h            ; Call DOS interrupt ,

    ; Take input character
    mov ah, 01h        ; DOS service to read a single character from the keyboard and moves to 'al' register automatically
    int 21h            ; Call DOS interrupt

    ; Display the entered character
    mov ah, 02h        ; DOS service to print a character              
                       ; 02h function used to print a single character and work with 'dl' register
    mov dl, al         ; Load the input character into DL for output
    int 21h            ; Call DOS interrupt

    ; Exit the program
     mov ah, 4Ch        ; DOS service to exit program
     int 21h            ; Call DOS interrupt

main endp
