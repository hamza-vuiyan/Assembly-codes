.model small
.stack 100h

.data
identity db 'My name is Md. Amir Hamza. ID: IT22046',0ah,0dh,'$'
pattern db '*********',0ah,0dh
db '*********',0ah,0dh
db '*********',0ah,0dh
db '*********',0ah,0dh
db '*********',0ah,0dh
db '*********',0ah,0dh
db '*********',0ah,0dh
db '*********',0ah,0dh
db '*********',0ah,0dh
db '*********$',0ah,0dh    

msg3 db '***', 0ah, 0dh
db '***', 0ah, 0dh
db '***', 0ah, 0dh
db '***$', 0ah, 0dh


.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,identity
    mov ah,09h
    int 21h

    lea dx,pattern
    int 21h
    
    mov ah,4ch
    int 21h
main endp
end main