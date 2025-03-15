                                                                                                                            
.model small
.stack 200h

.data
 
    identity db "My name is Md. Amir Hamza. ID: IT22046" ,0ah, 0dh, "$"
    instruction db "?$"
    newline db 0ah, 0dh, "$"

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
        int 21h
        mov cl, al
        
        mov ah, 09h
        lea dx, newline
        int 21h
        
        cmp bl, cl
        jle bl_first
        jg cl_first
               
        bl_first:
            mov ah, 02h
            mov dl, bl
            int 21h
            mov dl, cl
            int 21h
            jmp end
       cl_first:
            mov ah, 02h
            mov dl, cl
            int 21h
            mov dl, bl
            int 21h
            jmp end             
        
        end:
            mov ah, 04Ch
            int 21h
    main endp
    end main
    