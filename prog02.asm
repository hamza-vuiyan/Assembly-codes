.model small
.stack 200h

.data
    A db ?
    B db ?
    
    identity db "My name is Md. Amir Hamza. ID: 22046 $"
    instruction db 0ah, 0dh, "Enter the value of A: $"
    instruction2 db 0ah, 0dh, "Enter the value of B: $"
    result db 0ah, 0dh, "Result is: $"
    
.code
    main proc  
        mov ax, @data
        mov ds, ax  
        
        ;prints identity
        mov ah, 09h
        lea dx, identity
        int 21h      
        
        ;prints instruction for A
        lea dx, instruction
        int 21h  
        
        mov ah, 01h
        int 21h  
        mov A, al 
        
        ;prints instruction for B
        mov ah, 09h
        lea dx, instruction2
        int 21h
        
        mov ah, 01h
        int 21h 
        mov B, al
        
        ;working
        mov al, 2
        sub A, 48
        sub B, 48
   
        mov bl, A
        mul bl     ;now al = 2*A
        
        mov bl, B  ; bl = B
        
        sub bl, al  
        ; final result in bl now // bl = B - (2*A)
        
        add bl, 48   ; converting to numeric

        ;prints result
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
    