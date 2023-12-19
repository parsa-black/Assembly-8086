;---------------------
; Code By Parsa_Black |
;---------------------
data segment
    buffer DB 80, ? ; Define an array for storing text input
    message DB 13, 10, "ENTER A STRING: $"  ; Message to display to the user
data ENDS

stack segment
    DW 128 DUP(0) ; STACK SEGMENT
stack ENDS

code segment
START:
    MOV AX, DATA
    MOV DS, AX ; Set the value of DS

    LEA DX, MESSAGE ; Load the address of the message into DX
    MOV AH, 9 ; Set AH to 9 (display a string)
    INT 21H  ; Call a system function

    MOV AH, 0AH ; Set AH to 0Ah (read a string)
    LEA DX, BUFFER ; Load the address of the buffer array into DX
    INT 21H ; Call a system function to read text input

    LEA DX, BUFFER + 2 ; Load the address of the entered text into DX (excluding the header)
    MOV AH, 9 ; Set AH to 9 (display a string)
    INT 21H ; Call a system function to display the entered text

    MOV AX, 4C00H ; Value for program exit
    INT 21H ; Call a system function to exit

code ENDS
END START ; Define the starting point of program execution
