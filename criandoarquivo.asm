.model small
org 100h
.data
filename db "E:\testando.txt", 0
handle dw ? ;variavel criada para armazenar o handle, uma vez que o registrador AX será sobrescrito
erro db "Erro de criacao de arquivo $"

.code
    mov ax, @data
    mov ds, ax
    main proc
        mov ah, 3ch ; INSTRUÇÃO CRIAR ARQUIVO
        mov dx, offset filename ;passa para dx o nome/endereço do arquivo a ser criado
        int 21h ; CRIA ARQUIVO, AX PASSA A ARMAZENAR O HANDLE DO ARQUIVO
        mov handle, ax ;guarde o filehandle na variavel 'handle'
        jc fail ;CASO CF=1 PULE PARA A ROTINA FAIL
        jmp fimprog; SE CF=0 PULE PARA A ROTINA FIMPROG
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
