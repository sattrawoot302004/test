global to_string
global newline
global console_output 

section .data
	msg dq 0
	msglen equ 1
	NEWLINE db 10

section .text
to_string:
	add rax , '0'
	mov qword [msg] , rax
	ret
	
console_output:
	mov rax , 1
	mov rdi , 1
	mov rsi , msg
	mov rdx , 1
	syscall
	ret
	
newline:
	mov rax , 1
	mov rdi , 1
	mov rsi , NEWLINE
	mov rdx , 1
	syscall
	ret

	
