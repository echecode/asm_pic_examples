#include "p16f628a.inc"

; CONFIG
; __config 0xFF50
 __CONFIG _FOSC_INTOSCIO & _WDTE_OFF & _PWRTE_ON & _MCLRE_OFF & _BOREN_ON & _LVP_OFF & _CPD_OFF & _CP_OFF
 
    ;Asignación de nombres a direcciones de memoria 
STATUS	    equ 0x03        ; Registro STATUS, para seleccionar bancos (entre otras cosas)
TRISB	    equ 0x86        ; Registro TRISB, para configurar entradas o salidas del PUERTOB
PORTB	    equ 0x06        ; Registro PORTB, bits que corresponden a pines/hardware del micro
OPTREG      equ 0x01        ; Registro OPT, para configurar el TIMER0 (entre otras cosas)
INTCON	    equ 0x0B        ; Registro INTCON, bits de condición de interrupción(entre otras cosas)
TMR0        equ 0x01        ; Registro del TIMER0

    org 0x00                ; Indica posición 0 (reset) del microcontrolador

    ;CONFIGURACIONES
    ;BANK1
    bsf STATUS,5            ;Direccionamiento: selección de banco 1    
    bcf TRISB,0             ;bit 0 del TRISB en 1 => bit 0 del PORTB como salida    
    ;TIMER0
    bcf OPTREG,5            ;T0CS freq. cristal/4 como clock del TIMER0
    bcf OPTREG,3            ;PSA Asignamos el prescaler al TIMER 
    bsf OPTREG,0            ;PS0 Configuramos prescaler para contar uno cada 256 ciclos 1:256 bit 
    bsf OPTREG,1            ;PS1 [0,1,2] en del OPTREG en 1. 
    bsf OPTREG,2            ;PS2 opción 111 de la tabla (ver manual)    
    ;BANK0
    bcf STATUS,5            ;Direccionamiento: selección de banco 0
    
    ;PROGRAMA PRINCIPAL
test:   btfss INTCON,2      ;test de bandera bit T0IF, indica desbordó timer(overflow)
        goto test           ;si no esta en uno, seguimos chequeando (vuelve a test)
	
        bcf INTCON,2        ;bajamos bandera y continúa la ejecución

cambia: btfss PORTB, 0      ;conmuta leds (si estaba encendido, apaga, y viceversa)
        goto prende
        goto apaga

prende: bsf PORTB, 0        ;pone en uno bit 0 del PORTB (enciende led)
        goto test

apaga:  bcf PORTB, 0        ;pone en cero bit 0 del PORTB (apaga led)
        goto test

        end


