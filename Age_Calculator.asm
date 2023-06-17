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



;----------------------System Date--------------------------

MOV AH,2AH    ; To get System Date
INT 21H
MOV AL,DL     ; Day is in DL
AAM

;MOV BH,day2
;ADD BH,18H
;MOV BL,day1
;ADD BL,18H

;CMP BL,AL
;JG  D1
;SUB AL,BL
;RE1:

;CMP BH,AH
;JG D2
;SUB BH,AH

;RE2:




;D1 PROC
;ADD AL,10H
;SUB AH,01H
;SUB AL,BL

;CALL RE1
         
;D2 PROC
;ADD AH,10H
;MOV BL,month2
;SUB BL,01H         
;SUB AH,BH
;CALL RE2     





END START ; set entry point and stop the assembler.
