.model small
org 100h
.data
quebralinha db 10, 13, "$"
.code
    main proc
        mov ah, 01h
        int 21h
        mov ch, 0
        mov cl, al
        sub cl, 48
        mov dx, offset quebralinha
        mov ah, 09h
        int 21h
        print:
            mov dl, '.'
            mov ah, 02h
            int 21h
        loop print
    endp
end main