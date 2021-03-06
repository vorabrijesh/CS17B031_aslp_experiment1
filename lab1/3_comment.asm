	.file	"3.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp-8 				; stack[top-0] <- [rbp]
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp			 ; rbp <- [rsp]
	.cfi_def_cfa_register 6
	sub	rsp, 64 			; rsp <- rsp-64
	mov	rax, QWORD PTR fs:40  		; rax<-fs
	mov	QWORD PTR [rbp-8], rax 		; [rbp-8]<- rax  
	xor	eax, eax  			;eax<- eax^ eax; rax <- 0
	mov	DWORD PTR [rbp-52], 0		;[rbp-52]<- 0  
	jmp	.L2				; jump to .L2;
.L3:
	mov	eax, DWORD PTR [rbp-52]		; eax <- [rbp-52]	 
	cdqe					; convert doubleword to quadword
	mov	edx, DWORD PTR [rbp-52]		; edx<- [rbp-52]	
	mov	DWORD PTR [rbp-48+rax*4], edx	; [rbp-48+rax*4]<- edx	;
	add	DWORD PTR [rbp-52], 1		;[rbp-52]<-[rbp-52]+ 1 
.L2:
	cmp	DWORD PTR [rbp-52], 9		; compare [rbp-52] to  9 
	jle	.L3				; jump  to L3 if ,if condition is met
	mov	eax, DWORD PTR [rbp-32]		;eax <- [rbp-32]
	add	eax, 1 				;eax<- eax +1
	mov	DWORD PTR [rbp-32], eax 	; [rbp-32] <- eax
	mov	eax, DWORD PTR [rbp-28]		; eax <- [rbp-28]
	add	eax, 1 				; eax <- eax+1
	mov	DWORD PTR [rbp-28], eax		; [rbp-28] <- eax
	mov	eax, 0				; eax <- 0
	mov	rcx, QWORD PTR [rbp-8]		;rcx <- [rbp-8]	
	xor	rcx, QWORD PTR fs:40		;rcx <- rcx ^ fs
	je	.L5  				; jump equal to L5		
	call	__stack_chk_fail	
.L5:
	leave		
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
