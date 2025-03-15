.model small
.stack 200h

.data
    A db ?
    B db ? 
    R db ?
    
    identity db "My name is Md. Amir Hamza. ID: 22046 $" 
    instruction db 0ah, 0dh, "? $"
    first db 0ah, 0dh, "Sum of $"
    second db " and $"
    third db " is $"
        
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
        
        mov bl, al
        
        mov ah, 01h
        int 21h
        
        mov A, bl
        mov B, al
        
        sub al, 48
        sub bl, 48
          
        add bl, al
        
        add bl, 48
         
        mov R, bl
        
        ;prints result
        mov ah, 09h
        lea dx, first
        int 21h
         
        mov ah, 02h
        mov dl, A
        int 21h
        
        mov ah, 09h
        lea dx, second
        int 21h
        
        mov ah, 02h
        mov dl, B
        int 21h
        
        mov ah, 09h
        lea dx, third
        int 21h
        
        mov ah, 02h
        mov dl, R
        int 21h 
        
        mov ah, 04Ch
        int 21h
    main endp
    end main
    