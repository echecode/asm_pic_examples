		__config 0x3F30

STATUS equ 0x03
PORTA equ 0x05
PORTB equ 0x06
TRISA equ 0x85
TRISB equ 0x86
CMCON equ 0x1F

contador  equ 0x20
contador2 equ 0x21

		org 0x00; inicio del proyecto
		
		movlw 0x07
		movwf CMCON

		bsf STATUS,5; banco 1
		clrf TRISB;  Todo el puerto B como salida
		bsf TRISA,1; RA1 como entrada
		bcf STATUS,5; banco 0

		movlw 0xFF
		movwf PORTB

ini:		call retardo
		call retardo
		call retardo 

		clrf PORTB

bucleA:		bsf PORTB,0

		call retardo
	
   	 	bcf PORTB,0
		bsf PORTB,1

		call retardo
		bcf PORTB,1
		bsf PORTB,2

		call retardo
		bcf PORTB,2
		bsf PORTB,3

		call retardo
		bcf PORTB,3
		bsf PORTB,4

		call retardo
		bcf PORTB,4
		bsf PORTB,5

		call retardo
		bcf PORTB,5
		bsf PORTB,6

		call retardo
		bcf PORTB,6
		bsf PORTB,7

		call retardo
		bcf PORTB,7
		bsf PORTB,6

		call retardo
		bcf PORTB,6
		bsf PORTB,5
		
		call retardo
		bcf PORTB,5
		bsf PORTB,4

		call retardo
		bcf PORTB,4
		bsf PORTB,3

		call retardo
		bcf PORTB,3
		bsf PORTB,2
		
		call retardo
		bcf PORTB,2
		bsf PORTB,1

		call retardo
		bcf PORTB,1
		goto bucleA


retardo:	call retardoB	
		call retardoB
		call retardoB
		call retardoB
		call retardoB		
		call retardoB
		return


retardoB:	movlw 0xFF
retAnidado:	movwf contador2
bucle2:		decfsz contador2,1
		goto retardar
		goto salir
retardar:	call retardoBucle
		goto bucle2
salir:		return		

retardoBucle:	movlw d'200'
		movwf contador
bucle:		decfsz contador,1
		goto bucle
		return

		end
