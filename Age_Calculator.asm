; multi-segment executable file template.

.Data segment
; add your data here!
M01 db  "Welcome$"
M02 db  "Enter Your Birth Year:$"
M03 db  "Enter Your Birth Month:$"
M04 db  "Enter Your Birth Day:$"

day1    db ?  ; (_X)
day2    db ?  ; (X_)
month1  db ?  ; (_X)
month2  db ?  ; (X_)
year1   db ?  ; (_X)
year2   db ?  ; (X_)

    
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

LEA DX, M01   ; Welcom Message
MOV AH, 09H
INT 21H

MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

;----------------------Year--------------------------

LEA DX, M02   ; Enter Year Message
MOV AH, 09H
INT 21H


; Get Year 
MOV AH,01H    ; Get Year
INT 21H
SUB AL,48H    ;Convert Asci Value to Decimal
MOV year2,AL

INT 21H
SUB AL,48H    ;Convert Asci Value to Decimal
MOV year1,AL

; Show Year
MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

MOV AH,02H
MOV DL,year2
ADD DL,48H
int 21h

MOV DL,year1
ADD DL,48H
int 21h

;----------------------Month--------------------------

MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

LEA DX, M03   ; Get Month Message
MOV AH, 09H
INT 21H


; Get Month
MOV AH,01H    ; Get Month
INT 21H
SUB AL,48H    ;Convert Asci Value to Decimal
MOV month2,AL

INT 21H
SUB AL,48H    ;Convert Asci Value to Decimal
MOV month1,AL


MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

; Show Month
MOV AH,02H
MOV DL,month2
ADD DL,48H
int 21h
MOV DL,month1
ADD DL,48H
int 21h 

;----------------------Day-------------------------- 

MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

LEA DX, M04   ; Get Day Message
MOV AH, 09H
INT 21H

; Get Day
MOV AH,01H    ; Get Day
INT 21H
SUB AL,48H    ;Convert Asci Value to Decimal
MOV day2,AL

INT 21H
SUB AL,48H    ;Convert Asci Value to Decimal
MOV day1,AL


MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

; Show Day
MOV AH,02H
MOV DL,day2
ADD DL,48H
int 21h
MOV DL,day1
ADD DL,48H
int 21h


MOV AH,4CH     ; To Terminate the Program
INT 21H


; Day
MOV AH,2AH
INT 21H
MOV AL,DL
AAM
MOV BX,AX
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
