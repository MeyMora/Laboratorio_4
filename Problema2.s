    .section .data
X:      .word 5   @ Aquí definimos X 
result: .word 1   @ Variable para almacenar el resultado del factorial

    .section .text
    .global _start

_start:
	LDR R0, =X       @ Cargar dirección de X
	LDR R1, [R0]     @ Cargar valor de X en R1
	MOV R2, #1       @ Inicializar resultado (factorial = 1)
	MOV R4, R1       @ Guardar copia de X en R4 antes de modificar R1

factorial_loop:
    CMP R1, #1       @ Si X <= 1, salir del bucle
    BLE end_factorial 

    MUL R2, R2, R1   @ Multiplicar resultado por X
    SUB R1, R1, #1   @ X = X - 1
    B factorial_loop @ Repetir el proceso

end_factorial:
    LDR R3, =result  @ Cargar dirección de result
    STR R2, [R3]     @ Almacenar el resultado del factorial
    MOV R7, #1       @ Código de salida
    SVC 0            @ Terminar ejecución
