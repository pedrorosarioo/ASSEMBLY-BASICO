.model small
org 100h
.data
msg1 db 13, 10, "Hora: $"
msg2 db 13, 10, "Minutos: $"
quebralinha db 13, 10, "$"
.code
    mov ax, @data
    mov ds, ax
    main proc
        mov ah, 2ch
        int 21h
        
        mov bh, ch
        mov bl, ah        
        mov ch, 0
        mov cl, bh
        
        mov dx, offset msg1
        mov ah, 09h
        int 21h
        horas:
            mov dl, '.'
            mov ah, 02h
            int 21h
        loop horas
        
        mov dx, offset quebralinha
        mov ah, 09h
        int 21h
        
        mov cl, bl
        mov dx, offset msg2
        mov ah, 09h
        int 21h
        minutos:
            mov dl, '.'
            mov ah, 02h
            int 21h
        loop minutos
        endp
   end main