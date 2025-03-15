                                                                                                                            
.model small
.stack 200h

.data
 
    identity db "My name is Md. Amir Hamza. ID: IT22046" ,0ah, 0dh, "$"
    instruction db "?$"
    new db 0ah, 0dh, "$"

.code
    main proc  
        mov ax, @data
        mov ds, ax     
        
        ;prints identity
        mov ah, 09h
        lea dx, identity
        int 21h
                
        mov cx, 128
        mov bx, 0
        mov ah, 02h
        
        lop:
           mov ah, 02h
           mov dx, cx
           int 21h
           mov dl, ' '
           int 21h
           cmp cx, 255
           je end
           inc cx
           inc bx
           cmp bx, 10
           je newline
           jne lop    
           
       newline:
               mov bx, 0
               mov ah, 09h
               lea dx, new
               int 21h
               jmp lop
 
                     
        
        end:
            mov ah, 04Ch
            int 21h
    main endp
    end main
    