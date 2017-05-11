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
        push dx ;mova 'a' para o topo da pilha
        mov dl, 'b'
        push dx ;mova 'b' para o topo da pilha
        mov dl, 'c'
        pop dx ; passe o topo da pilha para o registrador dx ('b')
        mov ah, 02h ; exibir caractere na tela
        int 21h ; exibe o caractere 'b'
        mov ah, 4ch
        int 21h
        
    endp
    end main
        
