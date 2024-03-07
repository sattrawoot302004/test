section .text

extern _start

global function
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
	
