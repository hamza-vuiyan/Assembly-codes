
.model small
.stack 200h

.data
    A db ?
    B db ?
    
    identity db "My name is Md. Amir Hamza. ID: 22046 $" 
    newline db 0ah, 0dh, "$"
    
    
.code
    main proc  
        mov ax, @data
        mov ds, ax  
        
        ;prints identity
        mov ah, 09h
        lea dx, identity
        int 21h        

        lea dx, newline
        int 21h
        
        mov ah, 01h
        int 21h
        
        sub al, 96
        add al, 64
        
        mov bl, al
        
        ;prints result
        mov ah, 09h
        lea dx, newline
        int 21h
        
        mov dl, bl
        mov ah, 02h
        int 21h
        
        mov ah, 04Ch
        int 21h
    main endp
    end main
    