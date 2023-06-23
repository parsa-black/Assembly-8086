.model small
.Data
; add your data here!
M01 db  "Welcome$"
M02 db  "Years:$"
M03 db  "Months:$"
M04 db  "Days:$"
RES db 10 DUP ('$')
                 
year     db 02
month    db 03
day      db 27

ageD    dw ?  ; Day
ageM    dw ?  ; Month
ageY    dw ?  ; Year

    
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

MOV AH,2AH
INT 21H
; CX = Year
MOV DX,CX
MOV AX,00H
MOV AL,year
CMP AL,24
JG  OLD
ADD AX,7D0H
SUB DX,AX
MOV ageY,DX
JMP MONTH_CALC

OLD PROC NEAR
ADD AX,76CH
SUB DX,AX
MOV ageY,DX
JMP MONTH_CALC

;----------------------Month--------------------------

MONTH_CALC:

MOV AH,2AH
INT 21H
; DH = Month

MOV AL,DH
MOV AH,MONTH
CMP AH,AL
JG  MONTH_LABEL
SUB AL,AH
MOV AH,00H
MOV ageM,AX
JMP DAY_CALC


MONTH_LABEL:
; YEAR - 1
ADD AL,0CH
SUB AL,AH
MOV AH,00H
MOV ageM,AX
JMP DAY_CALC

;----------------------Day--------------------------

DAY_CALC: 

MOV AH,2AH    ; To get System Date
INT 21H

MOV AL,DL
MOV AH,DAY
CMP AH,AL
JG  DAY_LABEL
SUB AL,AH
MOV AH,00H
MOV ageD,AX
JMP SHOW

DAY_LABEL:
; MONTH-1
ADD AL,1EH
SUB AL,AH
MOV AH,00H
MOV ageD,AX
JMP SHOW



;;----------------------SHOW Welcome---------------------------

SHOW:
LEA DX, M01   ; Welcom Message
MOV AH, 09H
INT 21H

MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

;;----------------------SHOW Year---------------------------

LEA DX, M02
MOV AH,09H
INT 21H

; Show Year
MOV AX,ageY

LEA SI,RES
CALL HEX2DEC

LEA DX,RES
MOV AH,09H
INT 21H

;;----------------------SHOW Month---------------------------

MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

LEA DX, M03
MOV AH,09H
INT 21H

; Show Month
MOV AX,ageM

LEA SI,RES
CALL HEX2DEC

LEA DX,RES
MOV AH,09H
INT 21H

;;----------------------SHOW Day---------------------------

MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

LEA DX, M04
MOV AH,09H
INT 21H

; Show Month
MOV AX,ageD

LEA SI,RES
CALL HEX2DEC

LEA DX,RES
MOV AH,09H
INT 21H

;;----------------------End MS-DOS---------------------------

MOV AH,4CH     ; To Terminate the Program
INT 21H


;;----------------------HEX TO DEC---------------------------

HEX2DEC PROC NEAR
    MOV CX,0
    MOV BX,10
   
LOOP1: MOV DX,0
       DIV BX
       ADD DL,30H
       PUSH DX
       INC CX
       CMP AX,9
       JG LOOP1
     
       ADD AL,30H
       MOV [SI],AL
     
LOOP2: POP AX
       INC SI
       MOV [SI],AL
       LOOP LOOP2
       RET
HEX2DEC ENDP

;;----------------------END-------------------------- 

END START ; set entry point and stop the assembler.
