                                                      
.model small
.stack 200h

.data
 
    identity db "My name is Md. Amir Hamza. ID: IT22046" ,0ah, 0dh, "$"

.code
    main proc  
        mov ax, @data
        mov ds, ax     
        
        ;prints identity
        mov ah, 09h
        lea dx, identity
        int 21h        
        
        mov ah, 01h
        int 21h
        
         
        cmp al, '2'
        jne cev
        jmp even
        
        
        cev:
            cmp al, '4'
            je even
            jmp odd
            
            
        even:
            mov ah, 02h
            mov dl, 'E'
            int 21h
            jmp end
            
        odd:
            mov ah, 02h
            mov dl, 'O'
            int 21h
            jmp end
        
        end:
            mov ah, 04Ch
            int 21h
    main endp
    end main
    