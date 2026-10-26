Aufgabe 2
Untersuchung der Anw01 - Anw06:

Anw01 = "LDR load Register
die speicher position "0x2000000c" von "VariableA" wird in das register R0 geladen. (nicht der Wert sondern die Position)

Anw02 = "LDRB" load Register Byte
der inhalt an der Position die in R0 (VariableA) gespeichert is wir in das Register2 geladen. (der inhalt der VariableA wird in R2 angelegt)

Anw3 = "LDRB" load Register Byte
der inhalt an der Position die in R0 (VariableA) + 1 Byte  gespeichert is wir in das Register3 geladen. (der inhalt der VariableA + 1 Byte wird in R3 angelegt)

Anw04 = "LSL" Logical shift Left
die Zahl in R2 abgelegt wird mit 256 multipliziet und somit verschoben im 1 Byte (0xEF > 0xEF00 or 0000.0000 1110.1111 > 1110.1111 0000.0000)

Anw05 = ORR logical OR
die byt werte von R2 und R3 werden verglichen und wenn einen 1 vorhanden wird dieser zustand auf der position von R2 gespeicher ("Addiren" z.B. 0011 und 0100 wird zu 0111)

Anw06 = "STRH" Store register halfword
nun wird der wert von R2 (0xEFBE) and er position in R0 (position von VariableA) gespeichert die werte EF BE werden aber vertauscht also BEEF ist der finale wert welcher unter VariableA zu finden ist.

Anw07 = "mov" move
in R5 wird die zufor deffinierte "ConstByteA" geladen.

Anw08 = "STHR" Store register halfword
der wert der sich in R5 befindet wird wird unter der position aus R0 abgelegt.

Anw ergenzt 01 = "mov" move
der inhalt aus R5 (ConstByteA) wirt in R6 geladen.

Anw ergenzt 02 = "lsr" logicl shift right
die Byte position R6 + 1 Byte nach rechts, dieser wert wird unter R6 abgelegt.
samit isoliren wir "0xAf" "fe" wird nicgt in R6 abgelegt.

Anw ergenzt 03 = "and" logical and
bei and "0xfe" handelt es sich u eine Bits maske,  it welcher das Niederwertige Byte isoliert wird. In R7 wird also "0xfe" abgelegt.

Anw ergenzt 04 = "orr" logical oder
nun werden die werte die in R6(0xAf) und in R7(0xef00) mit orr "zusammengesätzt" bit für bit wird verglichen wenn eines 1 besitzt wird dieser zustand in R7 under der position gespeichert. z.B. (0011 orr 0110 > 0111)

Anw ergenzt 06 = "Strh" Store Register Halfword
jetzt wird der wert in R7(0xfeAf) an der in R4 hinterlegten position von VariableC gespeichert.

Anw09 = "Ldr" load Register
die Speicher position von VariableA wird in R1 angelegt.

Anw0A = "Ldrb" Load register Byte
der wert der an der Position in R1 abgelegt, wird in R6 abgelegt.

Anw0B = "Ldrb" Load register Byte
der wert der an der Position in (R1 + 1 Byte) gespeichert ist wird in R7 abgelegt.

Anw0C = "lsl" logical shift Left
der wert der in R6 hinterlegt ist wir um 8bit nach links verschoben. (0x34 > 0x3400)

Anw0D = "orr" logical oder
nun werden die werte die in R6(0x3400) und in R7(0x12) mit orr "zusammengesätzt" bit für bit wird verglichen wenn eines 1 besitzt wird dieser zustand in R7 under der position gespeichert.

Anw0E = "Strh" Store Register Halfword
nun wird der Wert in R7(0x3412) in der in R1 hinterlegtne speicherposition gespeichert.