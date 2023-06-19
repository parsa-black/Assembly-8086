; INT 21H (0A)
.Model small
.Stack 100h
;*************
.data 

     
                                 
          buff db 16             ; MAXIMUM IS 15 (+1 FOR ENTER)
               db ?              ; NUMBER OF CHARCTERS
               db 16 dup(0)      ; INPUT DATA
          
;***************************************************************
.code
main:
         MOV AX , @data
         MOV DS , AX
         
         MOV AH , 0AH            ; INSTURCTION
         MOV DX , offset buff    ; READ
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

           MOV AH , 9
           MOV DX , offset buff+2       ;start after 2
           INT 21H
           
           
           MOV AH , 4CH
           INT 21H
           
           end main