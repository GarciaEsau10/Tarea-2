;Garcia Cruz Esau Rafael
;Programa para calcular la raiz cuadrada de un  numero BCD en
;el registro B y almacenar el resultado en el C

        ORG 0x0000           ; Inicio del código en la dirección 0
        LD   A, 0            ; A = 0 (acumulador inicializado a 0)
        LD   C, 0            ; C = 0 (resultado de la raíz cuadrada)
        LD   D, 0            ; D = 0 (registro temporal para almacenar A^2)

SQRT_LOOP:
        LD   D, A            ; D = A, copia de A para el cálculo de A^2
        ADD  A, D            ; D = D + A (A^2 se construye sumando A repetidamente)
        JR   NC, CHECK       ; Si no hay acarreo, continuar con la comprobación
        INC  C               ; Incrementar C si se encontró la raíz cuadrada
        JR   END             ; Saltar al final

CHECK:
        CP   B               ; Comparar A^2 con B
        JR   C, NEXT         ; Si A^2 < B, probar con el siguiente número
        DEC  A               ; Si A^2 > B, decrementar A para obtener la parte entera
        LD   C, A            ; Guardar la parte entera de la raíz en C
        JR   END             ; Saltar al final

NEXT:
        INC  A               ; Aumentar el valor de A para probar con el siguiente
        JR   SQRT_LOOP       ; Repetir el ciclo de prueba

END:
        NOP                  ; No operación (fin del programa)
        JP   END             ; Bucle infinito para detener el programa
