.model small
org 100h
.data
mensagem1 db 13, 10, "Insira a sua string $"
quebralinha db 13, 10, "$"
mensagem2 db 13, 10, "Sua string e abaixo dela o numero de caracteres em pontos: $ "
string db 255 DUP('$')
.code
    main proc
        mov ax, @data
        mov ds, ax
    
        mov dx, offset mensagem1
        mov ah, 09h
        int 21h
        
        mov dx, offset quebralinha
        mov ah, 09h
        int 21h
        
        leitura:
            mov cx, 0
            mov si, offset string
            mov ah, 01h
            ler:
                int 21h
                mov [si], al
                inc si
                inc cx
                cmp al, 13
                jne ler
            endp
        endp
        mov dx, offset quebralinha
        mov ah, 09h
        int 21h
        escrita:
            mov dx, offset mensagem2
            mov ah, 09h
            int 21h
            
            mov dx, offset quebralinha
            mov ah, 09h
            int 21h
            
            lea dx, string
            mov ah, 09h
            int 21h
            
            mov dx, offset quebralinha
            mov ah, 09h
            int 21h
            
            sub cx, 1
            print:
                mov dl, '.'
                mov ah, 02h
                int 21h
            loop print        
        endp    
    endp
   end main