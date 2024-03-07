global _start

section .data
	msg dq 0
	msg1 dq 0
	msglen equ 1
	msg2 dq "."
	msg2len equ 1

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
	mov rsi , msg2
	mov rdx , msg2len
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
	jmp exit
	
	
exit:
	mov rax , 60
	mov rdi , 0
	syscall
	
console_output:
	mov rax , 1
	mov rdi , 1
	mov rsi , msg1
	mov rdx , 1
	syscall
	ret
	
to_string:
	add rax , '0'
	mov qword [msg1] , rax
	ret

