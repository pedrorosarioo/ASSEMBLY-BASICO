.model small   

.data

.code
    main proc
        
        mov cx,10
        
        top:
            
            mov dl, 'M'
            mov ah, 2h
            int 21h
            
            mov dl, 'S'
            mov ah, 2h
            int 21h
            
            mov dl, 'G'
            mov ah, 2h
            int 21h
            
            mov dl, ' '
            mov ah, 2h
            int 21h
            
         loop top
         
    endp
  
  end main