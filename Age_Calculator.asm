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


END START ; set entry point and stop the assembler.
