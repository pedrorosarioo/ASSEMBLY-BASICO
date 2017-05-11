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
        mov ah, 3dh ;ABRIR O ARQUIVO
        mov al, 2; ABRIR PARA LEITURA E ESCRITA
        mov dx, offset filename ;NOME DO ARQUIVO A SE ABRIR
        int 21h
        mov handle, ax
        jc fail ;ENCERRAR O PROGRAMA CASO HAJA FALHA NA ABERTURA DO ARQUIVO (CF=1)
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
            mov ah, 01h              ;S
            ler:                     ;C 
                int 21h              ;A
                mov [si], al         ;N
                inc si               ;F
                cmp al, 13           ;
                jne ler              ;
            endp                     ;
            inc si
            mov [si], '$'
            mov dx, offset string ; DADO QUE SE DESEJA GRAVAR NO ARQUIVO ABERTO (NO CASO UMA STRING)
            mov cx, 255 ; QUANTIDADE DE BYTES QUE SE DESEJA GRAVAR NO ARQUIVO ABERTO
            mov ah, 40h ; INSTRUÇÃO PARA GRVAR DADOS NO ARQUIVO
            int 21h ; GRAVANDO DADOS NO ARQUIVO
            jc fail ; SE CF=1 EXECUTE A ROTINA FAIL (MENSAGEM DE ERRO E ENCERRA O PROGRAMA)
        endp
        
        fimprog:
            mov ah, 3eh
            int 21h
            mov ax, 4ch
            int 21h
        endp
     endp
     end main 
      
            
        
        
        
