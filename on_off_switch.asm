STATUS	equ 0x03
PORTB 	equ 0x06
TRISB 	equ 0x86

		org 0x00		 

		bsf STATUS,5	; banco 1
		bcf TRISB,0		; configura RB0 como salida
		bsf TRISB,1		; configura RB1 como entrada
		bcf STATUS,5	; banco 0

		bcf PORTB,0		;comienza led apagado
		
bucle:	btfss PORTB,1	;espera switch on
		goto bucle
		bsf PORTB,0		;encendido
bucle2:	btfsc PORTB,1 	;espera switch off
		goto bucle2
		bcf PORTB,0		;apagar
		goto bucle
		
		end