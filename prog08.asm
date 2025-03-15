.model small
.stack 200h

.data
    A db ?

    
    identity db "My name is Md. Amir Hamza. ID: 22046 $" 
    instruction db 0ah, 0dh, "Enter a hex digit: $"
    resultA db 0ah, 0dh, "In decimal it is: 1$"
    resultN db 0ah, 0dh, "In decimal it is: $"

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
        
        cmp al, '0'
        jl alfa
        cmp al, '9'
        jg alfa    
        
        mov ah, 09h
        lea dx, resultN
        int 21h
        
        mov ah, 02h
        mov dl, A
        int 21h
        jmp end
        
        alfa:
            mov ah, 09h
            lea dx, resultA
            int 21h
            
            sub A, 65
            add A, 48
            
            mov ah, 02h
            mov dl, A
            int 21h
            
            
        
        
        ;prints result
        end:
        mov ah, 04Ch
        int 21h
    main endp
    end main
    