;Efecto ida y vuelta, versión hardcoded
reg_mem equ 0x21

			org 0x00; 
inicio:			bsf reg_mem,0			
			bcf reg_mem,0
			bsf reg_mem,1
			bcf reg_mem,1
			bsf reg_mem,2
			bcf reg_mem,2
			bsf reg_mem,3
			bcf reg_mem,3
			bsf reg_mem,4
			bcf reg_mem,4
			bsf reg_mem,5
			bcf reg_mem,5
			bsf reg_mem,6
			bcf reg_mem,6
			bsf reg_mem,7
			bcf reg_mem,7
			bsf reg_mem,7
			bcf reg_mem,7
			bsf reg_mem,6
			bcf reg_mem,6
			bsf reg_mem,5
			bcf reg_mem,5
			bsf reg_mem,4
			bcf reg_mem,4
			bsf reg_mem,3
			bcf reg_mem,3
			bsf reg_mem,2
			bcf reg_mem,2
			bsf reg_mem,1
			bcf reg_mem,1
			bsf reg_mem,0
			bcf reg_mem,0
			goto inicio
			end
