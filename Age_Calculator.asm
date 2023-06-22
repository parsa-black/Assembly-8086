.model small
.Data
; add your data here!
M01 db  "Welcome$"
M02 db  "Years:$"
M03 db  "Months:$"
M04 db  "Days:$"
                 
year     db 02
month    db 03
day      db 27

ageD    db ?  ; Day
ageM    db ?  ; Month
ageY    db ?  ; Year

    
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

;LEA DX, M01   ; Welcom Message
;MOV AH, 09H
;INT 21H

;MOV DL,0AH    ; New Line
;MOV AH,02H
;INT 21H

;MOV DL,0DH    ; Start New Line
;MOV AH,02H
;INT 21H

;----------------------Year--------------------------


MOV DL, YEAR


;----------------------Month--------------------------



MOV AL, MONTH


;----------------------Day-------------------------- 



MOV BH, DAY



;----------------------System Date Day--------------------------



;----------------------System Date Month--------------------------

MOV AH,2AH    ; To get System Date
INT 21H

MOV AL, MONTH
SUB DH,AL
MOV ageM,DH

; CX = Year
; DH = Month
; DL = Day

;----------------------System Date Year--------------------------


;;----------------------Calculate Year--------------------------




;;----------------------SHow Xla--------------------------.



;;---------------------------------------------------



;;----------------------END-------------------------- 
  
MOV AH,4CH     ; To Terminate the Program
INT 21H


END START ; set entry point and stop the assembler.
