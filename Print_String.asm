;---------------------
; Code By Parsa_Black |
;---------------------
.Model small 
;---------------------
.data                 
    M01  db "Enter String:$"
    M02  db "PRINT:$"
                                 
    buff db 16             ; MAXIMUM IS 15 (+1 FOR ENTER)
         db ?              ; NUMBER OF CHARCTERS
         db 16 dup(0)      ; INPUT DATA
          
;---------------------
.code
main:
MOV AX, @data
MOV DS, AX

LEA DX,M01   ; Message
MOV AH,09H
INT 21H

                  
MOV AH,0AH            ; INSTURCTION
MOV DX,offset buff    ; READ
INT 21H

; CHANGE CHR(13) BY '$'
            MOV SI , offset buff+1      ;NUMBER OF CHR ENTERD
            MOV CL , [SI]               ;MOVE LENHGT TO CL
            MOV CH , 0                  ;CLEAR CH TO USE CX
            INC CX
            ADD SI , CX                 ; SI POINTS TO CHR(13)
            MOV AL , '$'
            MOV [SI] , AL               ;REPLACE CHR(13) BY '$'


; PRINT STRING

MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H

LEA DX,M02   ; Print Message
MOV AH,09H
INT 21H

MOV DL,0AH    ; New Line
MOV AH,02H
INT 21H

MOV DL,0DH    ; Start New Line
MOV AH,02H
INT 21H


MOV AH ,09H
MOV DX ,offset buff+2       ;start after 2
INT 21H
         
MOV AH,4CH
INT 21H
           
END main
