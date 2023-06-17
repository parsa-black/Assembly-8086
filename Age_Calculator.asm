; multi-segment executable file template.

Data segment
    ; add your data here!
    Wel db  "Welcome$"
    Year db "Enter Your Birth Year (--xx):$"
    Mon db  "Enter Your Birth Month (number):$"
    Day db  "Enter Your Birth Day:$"
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, Data
    mov ds, ax
    mov es, ax

    ; add your code here
            
    lea dx, Wel
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
