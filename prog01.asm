.model small
.stack 200h

.data
    A db ?
    B db 5
    identity db "My name is Md. Amir Hamza. ID: 22046 $"
    instruction db 0ah, 0dh, "Enter the value of A: $"
    result db 0ah, 0dh, "Result is: $"
    
.code
    main proc  
        mov ax, @data
        mov ds, ax
        
        mov ah, 09h
        lea dx, identity
        int 21h
        
        lea dx, instruction
        int 21h  
        
        mov ah, 01h
        int 21h
        
        sub al, 30h
        
        mov bl, B
        sub bl, al
        add bl, 30h
        
        mov ah, 09h
        lea dx, result
        int 21h
        
        mov dl, bl
        mov ah, 02h
        int 21h
        
        
        
        mov ah, 04Ch
        int 21h
    main endp
    end main
    