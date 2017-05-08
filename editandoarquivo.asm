.model small
org 100h
.data
filename db "E:\testando.txt", 0
handle dw ?
erro db "Erro no momento de escrever $"
quebralinha db 13, 10, "$"
string db 255 DUP(13)

.code
    mov ax, @data
    mov ds, ax
    main proc
        mov ah, 3dh
        mov al, 2
        mov dx, offset filename
        int 21h
        mov handle, ax
        jc fail
        jmp sucess
        fail:
            mov dx, offset erro
            mov ah, 09h
            int 21h
            jmp fimprog
        endp
        sucess:
            mov bx, handle 
            ;mov ah, 42h
            ;mov al, 2
            ;mov cx, 0
            ;mov dx, 0
            ;int 21h
            mov si, offset string
            mov ah, 01h
            ler:
                int 21h
                mov [si], al
                inc si
                cmp al, 13
                jne ler
            endp 
            inc si
            mov [si], '$'
            mov dx, offset string
            mov cx, 255
            mov ah, 40h
            int 21h
            jc fail
        endp
        
        fimprog:
            mov ah, 3eh
            int 21h
            mov ax, 4ch
            int 21h
        endp
     endp
     end main 
      
            
        
        
        