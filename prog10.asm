.model small
.stack 100h

.data    
A db ?
B db ?
c db ?
identity db 'My name is Md. Amir Hamza. ID: IT22046',0ah,0dh,'$' 
instruction db "Enter three initials: $"

m1 db 0ah , 0dh, '***********',0ah,0dh
db '***********',0ah,0dh
db '***********',0ah,0dh
db '***********',0ah,0dh
db '***********$' 

c1 db 0ah, 0dh, '****$'
c2 db '****$'

m2 db 0ah, 0dh, '***********',0ah,0dh
db '***********',0ah,0dh
db '***********',0ah,0dh
db '***********',0ah,0dh
db '***********$',0ah,0dh    

beep db 07h, '$'     ;beep char

.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,identity
    mov ah,09h
    int 21h

    lea dx,instruction
    int 21h 
    
    mov ah, 01h
    int 21h
    mov A, al
    int 21h
    mov B, al
    int 21h
    mov C, al
    
    mov ah, 09h
    lea dx, m1
    int 21h
    lea dx, c1
    int 21h
    
    mov ah, 02h
    mov dl, A
    int 21h
    mov dl, B
    int 21h
    mov dl, C
    int 21h
    
    mov ah, 09h
    lea dx, c2
    int 21h
    lea dx, m2
    int 21h  
    
    lea dx, beep
    int 21h
    
    
    mov ah,4ch
    int 21h
main endp
end main