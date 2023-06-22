
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
; PARSA SAJEDI 9973122

org 100h

.data

    word1_a dw 1111h
    word1_b dw 2222h
    word2_a dw 3333h
    word2_b dw 4444h
    
.code

   MOV BX , word1_a
   MOV SI , word2_a
   ADC SI , BX
   MOV DX , SI
   MOV BX , 00H
   MOV SI , 00H
   MOV BX , word1_b
   MOV SI , word2_b
   ADC SI , BX
   ; Double word --> DX = LOW , SI = HIGHT 
   ; 4444 6666 FOR THIS EXAMPLE
   

ret




