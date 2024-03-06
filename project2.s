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

	mov rax , 100
	mov rbx , 2
	div rbx 
	push rdx
	add rax , '0'
	mov qword [msg] , rax

	mov rax , 1
	mov rdi , 1
	mov rsi , msg
	mov rdx , msglen
	syscall

	mov rax , 1
	mov rdi , 1
	mov rsi , msg2
	mov rdx , msg2len
	syscall


	pop rdx
	mov rax , rdx
	mov rcx , 0
	mov rdx , 0
	imul rax , 10
	idiv rax , rbx
	push rdx
	add rax , '0'
	mov qword [msg1] , rax
	mov rax , 1
	mov rdi , 1
	mov rsi , msg1
	mov rdx , 4
	syscall
	
	pop rdx
	mov rax , rdx
	mov rcx , 0
	mov rdx , 0
	imul rax , 10
	idiv rax , rbx
	push rdx
	add rax , '0'
	mov qword [msg1] , rax
	mov rax , 1
	mov rdi , 1
	mov rsi , msg1
	mov rdx , 4
	syscall
	
	pop rdx
	mov rax , rdx
	mov rcx , 0
	mov rdx , 0
	imul rax , 10
	idiv rax , rbx
	push rdx
	add rax , '0'
	mov qword [msg1] , rax
	mov rax , 1
	mov rdi , 1
	mov rsi , msg1
	mov rdx , 4
	syscall
	
	pop rdx
	mov rax , rdx
	mov rcx , 0
	mov rdx , 0
	imul rax , 10
	idiv rax , rbx
	push rdx
	add rax , '0'
	mov qword [msg1] , rax
	mov rax , 1
	mov rdi , 1
	mov rsi , msg1
	mov rdx , 4
	syscall
	
	


	mov rax , 60
	mov rdi , 0
	syscall

