org 0x7C00

section .text
start:
    mov ah, 0x0E   ; função BIOS para imprimir caractere teletipo
    mov al, 'H'
    int 0x10       ; chamar interrupção de vídeo BIOS
    mov al, 'e'
    int 0x10
    mov al, 'l'
    int 0x10
    mov al, 'l'
    int 0x10
    mov al, 'o'
    int 0x10

    jmp $          ; loop infinito

times 510-($-$$) db 0   ; preencher com zeros até 510 bytes
dw 0xAA55               ; assinatura de boot