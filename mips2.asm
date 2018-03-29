	.data
flstr:	.asciiz	"Fail!\n"
scstr:	.asciiz	"Success! Location: "
rtstr:	.asciiz	"\n"
instr:	.space	256
aim:	.space	10
	.text
main:	li	$s0,	63
	li	$s1,	10
rd:	li	$v0,	12
	syscall
	beq	$s0,	$v0,	ed
	la	$a0,	instr
	li	$v1,	0
	sb	$v0,	($a0)
	addi	$a0,	$a0,	1
	li	$a1,	254
	li	$v0,	8
	syscall
	subi	$t0,	$a0,	1
	la	$a0,	aim
	li	$a1,	9
	li	$v0,	8
	syscall
	lb	$v0,	($a0)
	move	$a0,	$t0
	li	$t0,	1
loop:	li	$t1,	0
	lb	$t1,	($a0)
	beq	$t1,	$s1,	fl
	beq	$t1,	$v0,	sccs
	addi	$a0,	$a0,	1
	addi	$t0,	$t0,	1
	j	loop
sccs:	la	$a0,	scstr
	li	$v0,	4
	syscall
	li	$v0,	1
	move	$a0,	$t0
	syscall
	la	$a0,	rtstr
	li	$v0,	4
	syscall
	j	rd
fl:	la	$a0,	flstr
	li	$v0,	4
	syscall
	j	rd
ed:

#ending