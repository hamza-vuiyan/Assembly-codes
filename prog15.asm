                                                                             
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
        
         
        cmp al, 'Y'
        je print
        cmp al, 'y'
        je print
        
        jmp end
        
        print:
            mov ah, 02h
            mov dl, al
            int 21h
        
        end:
            mov ah, 04Ch
            int 21h
    main endp
    end main
    