		__config 0x3F30

STATUS equ 0x03
PORTA equ 0x05
PORTB equ 0x06
TRISA equ 0x85
TRISB equ 0x86
CMCON equ 0x1F

		org 0x00; inicio del proyecto
		
		movlw 0x07
		movwf CMCON

		bsf STATUS,5; banco 1
		clrf TRISB;  Todo el puerto B como salida
		bsf TRISA,1; RA1 como entrada
		bcf STATUS,5; banco 0

		movlw 0xFF
		movwf PORTB

bucle:	btfss PORTA,1
		goto bucle
bucle2:	btfsc PORTA,1
		goto bucle2
		bsf PORTB,0
		bcf PORTB,1
		bsf PORTB,2
		bcf PORTB,3
		bsf PORTB,4
		bcf PORTB,5
		bsf PORTB,6
		bcf PORTB,7
bucle3:	btfss PORTA,1
		goto bucle3
bucle4:	btfsc PORTA,1
		goto bucle4
		bcf PORTB,0
		bsf PORTB,1
		bcf PORTB,2
		bsf PORTB,3
		bcf PORTB,4
		bsf PORTB,5
		bcf PORTB,6
		bsf PORTB,7
		goto bucle
		end

	