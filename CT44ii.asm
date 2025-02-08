.model small
.stack 200h

.data
    A db ?
    B db 1
    C db 2

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Compute 3 * B
    mov al, B    
    mov bl, 3    
    mul bl       ; AL = AL * BL (3 * B)

    ; Store result in BL
    mov bl, al   

    ; Compute 2 * C
    mov al, C    
    mov cl, 2    
    mul cl       ; AL = AL * CL (2 * C)

    ; Add both results
    add al, bl   
    
    mov A, al
     
    ; Convert to ASCII and print
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; Terminate program
    mov ah, 4ch
    int 21h

main endp
end main
