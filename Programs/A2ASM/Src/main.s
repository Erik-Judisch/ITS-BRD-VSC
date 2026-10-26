;******************** (C) COPYRIGHT HAW-Hamburg ********************************
;* File Name          : main.s
;* Author             : Martin Becke    
;* Version            : V1.0
;* Date               : 01.06.2021
;* Description        : This is a simple main to demonstrate data transfer
;                     : and manipulation.
;                     : 
;
;*******************************************************************************
    EXTERN initITSboard ; Helper to organize the setup of the board

    EXPORT main         ; we need this for the linker - In this context it set the entry point,too

ConstByteA  EQU 0xaffe
    
;* We need some data to work on
    AREA DATA, DATA, align=2    
VariableA   DCW 0xbeef
VariableB   DCW 0x1234
VariableC   DCW 0xAFFE

;* We need minimal memory setup of InRootSection placed in Code Section 
    AREA  |.text|, CODE, READONLY, ALIGN = 3    
    ALIGN   
main
    BL initITSboard             ; needed by the board to setup
;* swap memory - Is there another, at least optimized approach?
    ldr     R0,=VariableA   ; Anw01
    ldrb    R2,[R0]         ; Anw02
    ldrb    R3,[R0,#1]      ; Anw03
    lsl     R2, #8          ; Anw04
    orr     R2, R3          ; Anw05
    strh    R2,[R0]         ; Anw06 
    
;* const in var
    mov     R5,#ConstByteA  ; Anw07
    strh    R5,[R0]         ; Anw08

    Ldr     R4,=VariableC   ; Anw ergenzt 00
    mov     R6, R5          ; Anw ergenzt 01
    lsr     R6, R6, #8      ; Anw ergenzt 02
    and     R7,R5,#0xFF     ; Anw ergenzt 03
    LSL     R7, R7, #8      ; Anw ergenzt 04
    ORR     R7, R7, R6      ; Anw ergenzt 05 
    STRH    R7, [R4]        ; Anw ergenzt 06
    
;* Change value from x1234 to x4321
    ldr     R1,=VariableB   ; Anw09
    ldrb    R6,[R1]         ; Anw0A
    ldrb    R7,[R1,#1]      ; Anw0B
    lsl     R6, #8          ; Anw0C
    orr     R7, R6          ; Anw0D
    strh    R7,[R1]         ; Anw0F
    b .                     ; Anw10
    
    ALIGN
    END