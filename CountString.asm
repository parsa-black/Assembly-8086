;---------------------
; Code By Parsa_Black |
;--------------------- 
; count how much 'a' in the input string
.Model small
;---------------------
.Stack 100h           
;---------------------
.data 
                                 
   buff db 16             ; MAXIMUM IS 15 (+1 FOR ENTER)
        db ?              ; NUMBER OF CHARCTERS
        db 16 dup(0)      ; INPUT DATA
          

;----------------LIKE PRINT STRING------------------------------
.code
main:
      MOV AX , @data
      MOV DS , AX

      MOV BX , 00H
      MOV AH , 0AH            ; INSTURCTION
      MOV DX , offset buff    ; READ
      INT 21H

; CHANGE CHR(13) BY '$'

            MOV SI , offset buff+1      ;NUMBER OF CHR ENTERD
            MOV CL , [SI]               ;MOVE LENHGT TO CL
            
    LP:
       CMP CL , 0
       JE END
       DEC CL
       INC  SI
       CMP [SI] , 61H              ; 61H IS a (You Can Chnage everyThing You want in ascii)
       JE  LP1
       JMP LP

            

    LP1:
       INC BL
       JMP LP
               
               
           

    END: 
        MOV AH , 02H
        MOV DL , BL                 ;ASCII CODE IN DL
        ADD DL , 30H                ;CHANGE DL TO ASCII
        INT 21h
           
        end main