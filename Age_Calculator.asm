; multi-segment executable file template.

.Data segment
; add your data here!
M01 db  "Welcome$"
M02 db  "Enter Your Birth Year:$"
M03 db  "Enter Your Birth Month:$"
M04 db  "Enter Your Birth Day:$"
         
day1     db ?  ; (_X)
day2     db ?  ; (X_)
month1   db ?  ; (_X)
month2   db ?  ; (X_)
year1    db ?  ; (_X)
year2    db ?  ; (X_)
         
dayS1    db ?
dayS2    db ?
monthS1  db ?
monthS2  db ?
yearS1   db ?
yearS2   db ?

ageD     db ?  ; Day
ageM     db ?  ; Month
ageY     db ?  ; Year

    
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



;----------------------System Date Day--------------------------

MOV AH,2AH    ; To get System Date
INT 21H
MOV AL,DL     ; Day is in DL
AAM
MOV dayS2,AH
MOV dayS1,AL


; Show System Day
MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

MOV AH,02H
MOV DL,dayS2
ADD DL,30H
int 21h
MOV DL,dayS1
ADD DL,30H
int 21h

;----------------------System Date Month--------------------------

MOV AH,2AH    ; To get System Date
INT 21H
MOV AL,DH     ; Month is in DH
AAM
MOV monthS2,AH
MOV monthS1,AL


; Show System Month
MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

MOV AH,02H
MOV DL,monthS2
ADD DL,30H
int 21h
MOV DL,monthS1
ADD DL,30H
int 21h

;----------------------System Date Year--------------------------

MOV AH,2AH    ; To get System Date
INT 21H
ADD CX,0F830H
MOV AX,CX     ; Year is in CX
AAM
MOV dayS2,AH
MOV dayS1,AL


; Show System Year
MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

MOV AH,02H
MOV DL,days2
ADD DL,30H
int 21h
MOV DL,days1
ADD DL,30H
int 21h

   

END START ; set entry point and stop the assembler.
