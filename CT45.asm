.model small
.stack 200h

.data 
    instruction db "? $"
    result db 0dh, 0ah, "Result is: $"
    
.code 
    main proc
        mov ax, @data
        mov ds, ax
        
        ;printing instruction message
        mov ah, 09h
        lea dx, instruction
        int 21h
        
        mov ah, 01h ; taking first input
        int 21h
        mov bl, al 
        
        mov ah, 01h  ; taking 2nd input
        int 21h  
        
        add al, bl   ; adding al, bl
        sub al, 30h  ; result are in Hex so we need to substract 30h = 48 in decimal
        
        mov cl, al  ; moving result in cl for avoiding risking of overwritten by dos 09h
         
        ;printing result message
        mov ah, 09h
        lea dx, result
        int 21h
        
        ;printing actual result            
        
        mov al, cl
        mov ah, 02h
        mov dl, al
        int 21h
        
        
        mov ah, 4ch
        int 21h
    
    main endp
end main