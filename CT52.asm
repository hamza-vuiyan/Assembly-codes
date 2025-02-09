

.model small
.stack 200h

.data
    instruction db 0ah, 0dh, "Enter a hex digit: $"
    illegalmsg db 0ah, 0dh, "ILLEGAL CHARACTER - ENTER 0..9 OR A..F: $"
    numres db 0ah, 0dh, "In decimal it is: $"
    alphres db 0ah, 0dh, "In decimal it is: 1$"
    repeatmsg db 0ah, 0dh, "DO YOU WANT DO IT AGAIN? $"
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        

        
        jmp input
        
        input:
            mov ah, 09h
            lea dx, instruction
            int 21h
            mov ah, 01h
            int 21h
            jmp checkNum
        
        checkNum:
            cmp al, '0'
            jl checkAlph
            cmp al, '9'
            jg checkAlph
            
            jmp okNum
        
        checkAlph:
            cmp al, 'A'
            jl illegal
            cmp al, 'F'
            jg illegal
              
            jmp okAlph
        
        illegal:
            mov ah, 09h
            lea dx, illegalmsg
            int 21h  
            
            mov ah, 01h
            int 21h
            jmp checkNum 
            
        okNum: 
             mov cl, al
             
             mov ah, 09h
             lea dx, numres
             int 21h
             
             mov ah, 02h
             mov dl, cl 
             int 21h
             jmp repeat
             
         okAlph: 
             mov cl, al 
             sub cl, 41h
             add cl, 30h
             
             mov ah, 09h
             lea dx, alphres
             int 21h
             
             mov ah, 02h
             mov dl, cl 
             int 21h
             jmp repeat
             
             
        repeat:
             mov ah, 09h
             lea dx, repeatmsg
             int 21h
             
             mov ah, 01h
             int 21h
             cmp al, 'y'
             je input
             cmp al, 'Y'
             je input
             
             jmp end_
              
        
        end_:    
            mov ah, 4ch
            int 21h
            
    main endp
end main