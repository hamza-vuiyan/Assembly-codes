.model small
.data
m1 db 0ah,0dh,"Enter a Hex digit $"
m2 db 0ah,0dh,"In decimal it is:"
c1 db ?,"$"
m3 db 0ah,0dh,"Do you want to do it again? ","Y/N:$"
m4 db 0ah,0dh,"Illegal character, Enter 0-9 or A-F:$"
m5 db 0ah,0dh,"In decimal it is:1"
c2 db ?,"$"  
.code
main proc
    mov ax,@data
    mov ds,ax
    
    
    Begin:
        lea dx,m1
        mov ah,9
        int 21h 
          
    input:
        mov ah,1
        int 21h 
        
    cmp al,'0'
    jl illegal_check
    cmp al,'9'
    jg illegal_check
    
    mov c1,al
    mov ah,9
    lea dx,m2
    int 21h
    
    msg_show:
        mov ah,9
        lea dx,m3
        int 21h
            
        mov ah,1   ; take input y or n
        int 21h
        
        cmp al,'Y'
        je Begin 
        cmp al,'y'
        je Begin
        jmp end_
    
    illegal_check:
        cmp al,'A' 
        jl illegal
        cmp al,'F'
        jg illegal
    
    sub al,11h
    mov c2,al
    mov ah,9
    lea dx,m5
    int 21h
    
    jmp msg_show
        
    illegal:
        mov ah,9
        lea dx,m4
        int 21h
        jmp input 
        
    end_:
    mov ah,4ch
    int 21h
    main endp
end main

