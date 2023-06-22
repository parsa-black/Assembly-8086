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

MOV AH,2AH    ; To get System Date
INT 21H

MOV AL,DL
MOV AH,DAY
CMP AH,AL
JG  LABEL1
SUB AL,AH
MOV AH,00H
MOV ageD,AX

LABEL1:
ADD AL,1EH
SUB AL,AH
MOV AH,00H
MOV ageD,AX


; Show Day
MOV AX,ageD


LEA SI,RES
CALL HEX2DEC

LEA DX,RES
MOV AH,09H
INT 21H

MOV AH,4CH
INT 21H





;----------------------System Date Month--------------------------


; CX = Year
; DH = Month
; DL = Day

;----------------------System Date Year--------------------------


;;----------------------Calculate Year--------------------------




;;----------------------HEX TO DEC--------------------------.

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

;;---------------------------------------------------



;;----------------------END-------------------------- 
  
MOV AH,4CH     ; To Terminate the Program
INT 21H


END START ; set entry point and stop the assembler.
