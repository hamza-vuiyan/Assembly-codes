.model small
.stack 200h

.data
    A db ?
    B db ? 
    C db ?
    newline db 0ah, 0dh, "$"
    
    identity db "My name is Md. Amir Hamza. ID: 22046 $" 
    instruction db 0ah, 0dh, "Enter three intitials: $"
        
.code
    main proc  
        mov ax, @data
        mov ds, ax 
         
        ;prints identity
        mov ah, 09h
        lea dx, identity
        int 21h        

        lea dx, instruction
        int 21h
        
        mov ah, 01h
        int 21h   
        mov A, al
        
        mov ah, 01h
        int 21h
        mov B, al
        
        
        mov ah, 01h
        int 21h
        mov C, al 
        
        ;prints result
        mov ah, 09h
        lea dx, newline
        int 21h
        
        mov ah, 02h
        mov dl, A
        int 21h
        
        mov ah, 09h
        lea dx, newline
        int 21h
        
        mov ah, 02h
        mov dl, B
        int 21h
        
        mov ah, 09h
        lea dx, newline
        int 21h
        
        mov ah, 02h
        mov dl, C
        int 21h
        
         
        
        mov ah, 04Ch
        int 21h
    main endp
    end main
    