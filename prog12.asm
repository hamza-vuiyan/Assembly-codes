      
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

        mov al, 'F'
        mov bl, 'f'
        
        cmp al, bl
        jg bll
        je bll
        jl all
        
        all:
            mov ah, 02h
            mov dl, al
            int 21h
            jmp end
         
        bll:
            mov ah, 02h
            mov dl, bl
            int 21h
            jmp end
        
        
        end:
            mov ah, 04Ch
            int 21h
    main endp
    end main
    