;; My first IA-32 program!
;;
;; It shows "Hello, World" and exits normally

		section .data			; DATA

msg:	db "Hello, World!", 0xA ; Message to show
								; (DB assigns data to label)
size:	EQU	$ - msg				; Length of the message
								; (EQU assigns constant)
								; ($ is the current point
								;  $ - msg gives the actual
								;  length of msg)

		section .text			; CODE

		global _start 			; Global entry point for `ld`

_start:							; "main"
		nop						; This `nop` keeps gdb happy!

		mov	eax,	4			; Syscall number (sys_write)
		mov	ebx,	1			; File descriptor (stdout)
		mov	ecx,	msg			; Message to show
		mov	edx,	size		; Message length
		int	80h					; syscall (eax->edx: arguments)

		mov	eax,	1			; Syscall number (sys_exit)
		mov	ebx,	0			; Exit status ("return 0")
		int	80h					; syscall

