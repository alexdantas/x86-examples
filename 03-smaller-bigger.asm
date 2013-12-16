; test
;
; This program tests several IA-32 syntax things.

			  section .data
num_a:		  db	10
num_b:		  db	1

msg_smaller:  db	"Smaller!", 10
msg_smaller_size: EQU $-msg_smaller

msg_bigger:	  db	"Bigger!",  10
msg_bigger_size: EQU $-msg_bigger

			  section .text
			  global _start
_start:
			  nop					; This keeps gdb happy!

			  mov	al, [num_a]
			  mov	bl, [num_b]

			  cmp	al, bl
			  jb	smaller			; if (a > b) goto smaller

bigger:		  mov	eax, 4			; Will print string
			  mov	ebx, 1			; To standard output
			  mov	ecx, msg_bigger	; This string
			  mov	edx, msg_bigger_size ; With this size
			  int	80h
			  jmp	exit

smaller:	  mov	eax, 4			; Will print string
			  mov	ebx, 1			; To standard output
			  mov	ecx, msg_smaller ; This string
			  mov	edx, msg_smaller_size ; With this size
			  int	80h

exit:		  mov	eax, 1			; system exit code
			  mov	ebx, 0			; status 0
			  int	80h				; exit

