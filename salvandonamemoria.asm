.model small
org 100h
.stack 100h
.data
string db 255 DUP(13)
.code
    mov ax, @data
    mov ds, ax
    main proc
        mov dh, 0
        mov dl, 'a'
        push dx
        mov dl, 'b'
        push dx
        mov dl, 'c'
        pop dx
        mov ah, 02h
        int 21h
        mov ah, 4ch
        int 21h
        
    endp
    end main
        
