global _start

section .data

msg dq 0
msg1 dq 0000
msglen equ 1

section .text
_start:
mov rdx , 0
mov rax , 3
mov rbx , 7
div rbx 
push rdx
add rax , '0'
mov qword [msg] , rax

mov rax , 1
mov rdi , 1
mov rsi , msg
mov rdx , msglen
syscall

pop rdx
mov rax , rdx
imul rax , 100
idiv rax , rbx


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




	
	









