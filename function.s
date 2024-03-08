; Function to convert integer into ASCII code for output on console and newline.

global to_string
global newline
global console_output

section .data				; Data section.
	msg 		dq 	0
	msglen 		equ 	1
	NEWLINE 	db 	10

section .text				; Code section.
to_string:
	; Convert integer into ASCII code.
	add 	rax , '0'
	mov 	qword [msg] , rax
	ret

console_output:
	; Output on console.
	mov rax , 1
	mov rdi , 1
	mov rsi , msg
	mov rdx , 1
	syscall
	ret

newline:
	; New line on console.
	mov rax , 1
	mov rdi , 1
	mov rsi , NEWLINE
	mov rdx , 1
	syscall
	ret
