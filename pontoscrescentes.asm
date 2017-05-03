.model small   

.data

.code

    
    main proc
        mov bx, 1
        mov cx, 0
        top:    
        add cx, bx
        Inicio:
            mov dl, '.'
            mov ah, 2h
            int 21h

         loop Inicio
         inc bx 
         mov dl, ' '
         mov ah, 2h
         int 21h
         cmp bx, 10
         jbe top
         
    endp
  
  end main