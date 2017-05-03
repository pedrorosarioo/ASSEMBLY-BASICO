.model small  
org 100h

.data

quebralinha db 13, 10, "$"

.code


    main proc
        mov bx, 1
        Inicio:
        mov cx, bx
            top:
            
                mov dl, '.'
                mov ah, 02h
                int 21h
       
            loop top
            mov dx, offset quebralinha
            mov ah, 9
            int 21h
            inc bx
            cmp bx, 10
            jbe Inicio
    
    endp
    
    end main
    