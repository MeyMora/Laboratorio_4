    .section .data
array:  .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100  @ Definir el arreglo
y:      .word 5                                        @ Definir la constante y

    .section .text
    .global _start

_start:
    LDR R1, =array        @ Dirección base del arreglo
    LDR R2, =y            @ Dirección de la constante y
    LDR R3, [R2]          @ Cargar el valor de y en R3
    MOV R4, #0            @ Inicializar índice i

loop:
    CMP R4, #10           @ Comparar i con 10 (para recorrer los 10 elementos)
    BGE end               @ Si i >= 10, salir del bucle

    LDR R5, [R1, R4, LSL #2] @ Cargar array[i] en R5
    CMP R5, R3            @ Comparar array[i] con y
    BLT add_case          @ Si array[i] < y, ir a suma
    MUL R5, R5, R3        @ Si array[i] >= y, multiplicarlo por y
    B store_result

add_case:
    ADD R5, R5, R3        @ array[i] + y

store_result:
    STR R5, [R1, R4, LSL #2] @ Almacenar el resultado en array[i]
    ADD R4, R4, #1        @ Incrementar i
    B loop                @ Volver al inicio del bucle

end:
    MOV R7, #1
    SVC 0