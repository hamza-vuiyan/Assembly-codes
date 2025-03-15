

.model small
.stack 200h

.data
 
    identity db "My name is Md. Amir Hamza. ID: 22046" ,0ah, 0dh, "$"
    

.code
    main proc  
        mov ax, @data
        mov ds, ax  
        ;prints identity
        mov ah, 09h
        lea dx, identity
        int 21h        

        mov ax, 5
        mov bx, 3
        add ax, 48
        add bx, 48
        
        
        cmp ax, bx
        jg axx
        je axx
        jl bxx
        
        axx:
            mov cx, ax
            mov ah, 02h
            mov dx, cx
            int 21h
            jmp end
         
        bxx:
            mov cx, bx
            mov ah, 02h
            mov dx, cx
            int 21h
            jmp end
        
        
        end:
            mov ah, 04Ch
            int 21h
    main endp
    end main
    