global _start

extern to_string
extern console_output
extern newline

section .data
	msg dq 0
	msglen equ 1
	point dq "."
	pointlen equ 1
	NEWLINE db 10
	SYS_EXIT equ 60
	EXIT_SUCCESS equ 0

section .text
_start:
	mov rax , 0 
	mov rbx , 0
	mov rdx , 0

	mov rax , 55
	mov rbx , 7
	div rbx 
	push rdx
	call to_string
	call console_output

	mov rax , 1
	mov rdi , 1
	mov rsi , point
	mov rdx , pointlen
	syscall
	
	mov r10 ,0

doagain : 
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
	mov rax , SYS_EXIT
	mov rdi , EXIT_SUCCESS
	syscall
	
