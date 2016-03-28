			org 0x00		; inicia programa en dirección 0
inicio:			nop				
			bsf 0x20,4		; pone en 1 bit 4 del registro 0x20
			nop				
			nop				
			bcf 0x20,4		; pone en 0 bit 4 del registro 0x20
			goto inicio		
			end				; final 
