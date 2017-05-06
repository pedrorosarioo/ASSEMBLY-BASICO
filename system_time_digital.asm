.model small
org 100h
.data
.code
    mov ax, @data
    mov ds, ax
    main proc
        mov ah, 2ch
        int 21h
        
        mov al, ch
        aam
        mov bx, ax
        call EXIBE
        
        mov dl, ':'
        mov ah, 02h
        int 21h
        
        mov al, cl
        aam
        mov bx, ax
        call EXIBE
    
        mov dl, ':'
        mov ah, 02h
        int 21h
        
        mov al, dh
        aam
        mov bx, ax
        call EXIBE
 
        mov ah, 4ch
        int 21h
        
        EXIBE proc
            mov dl, bh
            add dl, 48
            mov ah, 02h
            int 21h
            mov dl, bl
            add dl, 48
            mov ah, 02h
            int 21h
            ret
        endp 
    
   end main