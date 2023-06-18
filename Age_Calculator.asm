; multi-segment executable file template.

.Data segment
; add your data here!
M01 db  "Welcome$"
M02 db  "Enter Your Birth Year:$"
M03 db  "Enter Your Birth Month:$"
M04 db  "Enter Your Birth Day:$"
M05 db  "Years:$"
M06 db  "Months:$"
M07 db  "Days:$"
         
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

ageD2    db ?  ; Day
ageD1    db ?  
ageM2    db ?  ; Month
ageM1    db ?  
ageY2    db ?  ; Year
ageY1    db ?  

    
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
SUB AL,30H    ;Convert Asci Value to Decimal 48
MOV year2,AL

INT 21H
SUB AL,30H    ;Convert Asci Value to Decimal
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
;MOV AH,02H
;MOV DL,day2
;ADD DL,48H
;int 21h
;MOV DL,day1
;ADD DL,48H
;int 21h



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

;MOV AH,02H
;MOV DL,dayS2
;ADD DL,30H
;int 21h
;MOV DL,dayS1
;ADD DL,30H
;int 21h

MOV DL,'/'
MOV AH,02H    ; To Print / in DOS
INT 21H

;----------------------System Date Month--------------------------

MOV AH,2AH    ; To get System Date
INT 21H
MOV AL,DH     ; Month is in DH
AAM
MOV monthS2,AH
MOV monthS1,AL


; Show System Month

;MOV AH,02H
;MOV DL,monthS2
;ADD DL,30H
;int 21h
;MOV DL,monthS1
;ADD DL,30H
;int 21h 

MOV DL,'/'
MOV AH,02H    ; To Print / in DOS
INT 21H

;----------------------System Date Year--------------------------

MOV AH,2AH    ; To get System Date
INT 21H
ADD CX,0F830H
MOV AX,CX     ; Year is in CX
AAM
MOV BH,05H
MOV yearS2,AH
MOV yearS1,AL


; Show System Year

;MOV AH,02H
;MOV DL,days2
;ADD DL,30H
;int 21h
;MOV DL,days1
;ADD DL,30H
;int 21h 

;;----------------------Calculate Year--------------------------

MOV BL,yearS1
CMP BL,year1
JL  TLY
SUB BL,year1
MOV ageY1,BL
JMP Y1

TLY:
ADD BL,10H
SUB BL,year1
MOV ageY1,BL
DEC yearS2


Y1:
MOV BX,00H
MOV BL,yearS2
CMP BL,year2
JL  TLY2
SUB BL,year2
MOV ageY2,BL

TLY2:
ADD BL,10H
SUB BL,year2
MOV ageY2,BL


;;----------------------SHow Xla--------------------------.

MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H


LEA DX, M05   ; Year
MOV AH, 09H
INT 21H

MOV DL,00H
MOV AH,02h
MOV DL,ageY2
ADD DL,30H
INT 21h
MOV DL,ageY1
ADD DL,30H 
INT 21h


MOV AH,4CH     ; To Terminate the Program
INT 21H


;;---------------------------------------------------
decrement_day proc
        
        
        mov bl, 1
        mov cl, 0
        cmp bl, monthS2
        jg  LP1
        sub monthS2, bl
        jmp next5              ;decrement function
                             ;decrement CurrentMonth
        LP1:
        add monthS2, 10
        sub monthS2, bl
        inc cl
    
        next5: 
        sub monthS1, cl
       
                             
        ret
        
endp decrement_day

decrement_month proc 
        
        mov bl, 1
        mov bh, 0
        mov cl, 0
        mov ch, 0             ;decrement CurrentYear
        
        cmp bl, yearS2
        jg t1
        sub yearS2, bl
        jmp case2
        t1:
        add yearS2, 10
        sub yearS2, bl
        inc bh
        
        case2:
        cmp bh, yearS1
        jg t2
        sub yearS1, bh
        jmp complete
        t2:
        add yearS1, 10
        sub yearS1, bh
        inc cl
        
        complete: 
        
        ret
       
endp decrement_month


;;----------------------END-------------------------- 
  
MOV AH,4CH     ; To Terminate the Program
INT 21H


END START ; set entry point and stop the assembler.
