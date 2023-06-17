; multi-segment executable file template.

.Data segment
; add your data here!
M01 db  "Welcome$"
M02 db "Enter Your Birth Year (--xx):$"
M03 db  "Enter Your Birth Month (number):$"
M04 db  "Enter Your Birth Day:$"

day1    db ?
day2    db ?
month1  db ?
month2  db ?
year1   db ?
year2   db ?

    
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
MOV AH,2AH
INT 21H
MOV AL,DL
AAM
MOV BX,AX
 
MOV AH,01H
INT 21H
SUB AL,48H
MOV day2,AL

INT 21H
SUB AL,48H
MOV day1,AL

MOV AH,02H
MOV DL,day2
ADD DL,48H
int 21h
MOV DL,day1
ADD DL,48H
int 21h


;CALL DISP

















;Month Part
;MOV AH,2AH    ; To get System Date
;INT 21H
;MOV AL,DH     ; Month is in DH
;AAM
;MOV BX,AX
;CALL DISP

;Year Part
;MOV AH,2AH    ; To get System Date
;INT 21H
;ADD CX,0F830H ; To negate the effects of 16bit value,
;MOV AX,CX     ; since AAM is applicable only for AL (YYYY -> YY)
;AAM
;MOV BX,AX
;CALL DISP

;MOV AH,4CH     ; To Terminate the Program
;INT 21H
                
;LEA DX, WEL
;MOV AH, 9
;INT 21H        ; output string at ds:dx
    
;Display Part
;DISP PROC
;MOV DL,BH      ; Since the values are in BX, BH Part
;ADD DL,30H     ; ASCII Adjustment
;MOV AH,02H     ; To Print in DOS
;INT 21H
;MOV DL,BL      ; BL Part 
;ADD DL,30H     ; ASCII Adjustment
;MOV AH,02H     ; To Print in DOS
;INT 21H
;RET
;DISP ENDP      ; End Disp Procedure

END START ; set entry point and stop the assembler.
