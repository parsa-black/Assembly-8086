;---------------------
; Code By Parsa_Black |
;---------------------
.Model Small
;---------------------
.Stack 100h
;---------------------
.data                
   
   MSG1 db 'Enter First Number: $'
   MSG2 db 'Enter Second Number: $'
   A1  db 'Answer Is: $'
   
;---------------------  
.code

main:
      MOV AX , @DATA
      MOV DS , AX

      
      MOV AH , 09H
      LEA DX , MSG1 ; MSG1
      INT 21H
      
      MOV AH , 01H  ; INPUT FIRST NUMBER 
      INT 21H
      MOV BL , AL
      
      MOV DL,0AH    ; New Line
      MOV AH,02H
      INT 21H

      MOV DL,0DH    ; Start New Line
      MOV AH,02H
      INT 21H
      
      MOV AL ,00H   ; CLEAR AL
      
      MOV AH , 09H
      LEA DX , MSG2 ; MSG2
      INT 21H
      
      MOV AH , 01H  ; INPUT SECOND NUMBER
      INT 21H
      MOV BH , AL
      
      
      CMP BL , BH   ; QADRE MOTLAQ
      JG NEXT
      XCHG BL , BH

NEXT:
 
      SUB BL , BH   ; Subtract
      
      
      MOV DL,0AH    ; New Line
      MOV AH,02H
      INT 21H

      MOV DL,0DH    ; Start New Line
      MOV AH,02H
      INT 21H
      
      MOV AH , 09H
      LEA DX , A1   ; A1
      INT 21H
      
      
      MOV AH , 02H
      MOV DL , BL
      ADD DL , 30H
      INT 21H
      
      end main
              