      
.model small
.stack 200h

.data
 
    identity db "My name is Md. Amir Hamza. ID: IT22046" ,0ah, 0dh, "$"
    negm db "-1$"

.code
    main proc  
        mov ax, @data
        mov ds, ax     
        
        ;prints identity
        mov ah, 09h
        lea dx, identity
        int 21h        

        mov ax, '0'
        
        cmp ax, '0'
        jg positive
        jl negative
        je zero
        
        
        positive:
            mov ah, 02h
            mov dx, ax
            int 21h
            jmp end
         
        zero:
            mov ah, 02h
            mov dx, ax
            int 21h
            jmp end
        negative:
            mov ah, 09h
            lea dx, negm
            int 21h
        
        
        end:
            mov ah, 04Ch
            int 21h
    main endp
    end main
    