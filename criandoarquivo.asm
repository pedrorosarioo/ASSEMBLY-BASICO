.model small
org 100h
.data
filename db "E:\testando.txt", 0
handle dw ?
erro db "Erro de criacao de arquivo $"
;string db 255 DUP(13)

.code
    mov ax, @data
    mov ds, ax
    main proc
        mov ah, 3ch ;CRIAR ARQUIVO
        mov dx, offset filename
        int 21h
        mov handle, ax
        jc fail ;CASO CF=1 ENCERRE O PROGRAMA
        jmp fimprog
        fail:
            mov dx, offset erro 
            mov ah, 09h ; PRINTA MENSAGEM DE ERRO
            int 21h
        endp
        fimprog:
            mov ah, 3eh ;FECHA ARQUIVO
            int 21h
            mov ax, 4ch ;ENCERRA O PROGRAMA
            int 21h
        endp
     endp
     end main 
