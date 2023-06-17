; multi-segment executable file template.

.Data segment
; add your data here!
WEL db  "Welcome$"
YEAR db "Enter Your Birth Year (--xx):$"
MON db  "Enter Your Birth Month (number):$"
DAY db  "Enter Your Birth Day:$"
    
ENDS

Stack segment
    dw   128  dup(0)
ENDS

Code segment
Start:
; set segment registers:
MOV AX, @Data
MOV DS, AX

; add your code here
; Day
                
LEA DX, WEL
MOV AH, 9
INT 21H        ; output string at ds:dx
    
; wait for any key....    
MOV ah, 1
INT 21H
    
MOV ax, 4C00H ; exit to operating system.
INT 21H    
ENDS

END START ; set entry point and stop the assembler.
