.model small
org 100h
.data
filename db "E:\teste.txt", 0
handle dw ?
erro db "Erro de criacao de arquivo $"
string db 255 DUP(13)

.code
    mov ax, @data
    mov ds, ax
    main proc
        mov ah, 3ch
        mov dx, offset filename
        int 21h
        mov handle, ax
        jc fail
        jmp fimprog
        fail:
            mov dx, offset erro
            mov ah, 09h
            int 21h
        endp
        fimprog:
            mov ah, 3eh
            int 21h
            mov ax, 4ch
            int 21h
        endp
     endp
     end main 
      
            
        
        
        
