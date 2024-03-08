;Main of program to division and output to console (decimal 4 digits).


global _start

; The function, to be call.
extern to_string
extern console_output
extern newline

section .data					;Data section.
	point 		dq 	"."
	pointlen 	equ 	1
	SYS_EXIT 	equ 	60
	EXIT_SUCCESS 	equ 	0

section .text					;Code section.
_start:
	; Start Program
	mov rax , 0 	; reset rax
	mov rbx , 0	; reset rbx
	mov rdx , 0	; reset rdx

	; Division part
	mov rax , 66	; Dividend
	mov rbx , 7	; Divisor
	div rbx
	push rdx
	call to_string
	call console_output

	; Output point(".").
	mov rax , 1
	mov rdi , 1
	mov rsi , point
	mov rdx , pointlen
	syscall

	mov r10 ,0
doagain :
	; Loop for output decimal 4 digits.
	pop rdx
	mov rax , rdx
	mov rcx , 0
	mov rdx , 0
	imul rax , 10
	idiv rax , rbx
	push rdx
	call to_string
	call console_output
	inc r10
	cmp r10 , 4
	jl doagain
	call newline
	jmp exit

exit:
	; Exit program.
	mov rax , SYS_EXIT
	mov rdi , EXIT_SUCCESS
	syscall
