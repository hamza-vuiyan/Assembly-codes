.model small

.stack 200h

.data
    B db 9     ; B = 5
    C db 1     ; C = 1
    A db ?     ; A = ?

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov al, 2       ; AL = 2
    mov bl, C       ; BL = C
    mul bl          ; AX = AL * BL = 2 * 1 = 2 (AX = 2, AL = 2, AH = 0)
    
    mov bl, B       ; BL = B (5)
    sub bl, al      ; BL = B - 2 * C = 5 - 2 = 3
    
    ; Convert result to ASCII
    add bl, 30h     
    
    ; Print result
    mov dl, bl      
    mov ah, 02h
    int 21h
    
    ; Terminate program
    mov ah, 4Ch
    int 21h
    
main endp
end main
