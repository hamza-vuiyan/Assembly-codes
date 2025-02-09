.model small
.stack 200h

.data
    instruction db 0dh, 0ah, "? $"
    newLine db 0dh, 0ah, "$"
    
.code
    main proc
        ;loading the data segment
        mov ax, @data
        mov ds, ax
        
        ;printing instruction messgage 
        mov ah, 09h
        lea dx, instruction
        int 21h
        
        ;using cx register as a counter and setting its value 0
        mov cx, 0
                 
                 
        ;reading the input
        read_loop:
            ;reading mode
            mov ah, 01h
            int 21h
            
            ;compering it's a carrige return or not (Enter key)
            cmp al, 0dh
            
            je print_newline ; jumps to print_newline if it's a Enter key
            
            push ax ; other wise the input pushed to stack
            inc cx ; counter increases
            jmp read_loop  ; repeat the procedure
        
        print_newline: ; prints the new line; (not so important, added only to show the out put in new line)
            mov ah, 09h
            lea dx, newLine
            int 21h
            jmp reverse ; jumps to the reverse section
        
        reverse:
            cmp cx, 0  ; comparing cx is become 0 or not
            je end_point ; if zero then end the program
            pop ax      ; pop character from stack, (this command move the pop character automatically in al register
            
            ; prints the poped char           
            mov dl, al             
            mov ah, 02h
            int 21h 
            
            dec cx  ;decresing cx by 1
            jmp reverse ; repeats the procedure
        
        ;terminates the program       
        end_point:
            mov ah, 4ch
            int 21h
    main endp
 end main