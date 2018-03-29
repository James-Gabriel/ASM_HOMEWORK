	.data
blk:	.asciiz " "
upwds:	.asciiz	"Alpha","22","Bravo","22","China","22","Delta","22","Echo","333","Foxtrot","","Golf","333","Hotel","22","India","22","Juliet","1","Kilo","333","Lima","333","Mary","333","November","Oscar","22","Paper","22","Quebec","1","Research","Sierra","1","Tango","22","Uniform","","Victor","1","Whisky","1","X-ray","22","Yankee","1","Zulu"
dnwds:	.asciiz "alpha","22","bravo","22","china","22","delta","22","echo","333","foxtrot","","golf","333","hotel","22","india","22","juliet","1","kilo","333","lima","333","mary","333","november","oscar","22","paper","22","quebec","1","research","sierra","1","tango","22","uniform","","victor","1","whisky","1","x-ray","22","yankee","1","zulu"
nums:	.asciiz "zero","333","First","22","Second","1","Third","22","Fourth","1","Fifth","22","Sixth","22","Seventh","","Eighth","1","Ninth","22"
star:	.asciiz "*"
	.text
main:	li	$s0,	1	#counter for whether to use the blank, if counter = 1 then the coming input is the first input of this thread so there is not a blankspace before it, and if it has been set 0 blankspace is needed
	li	$s1,	63	#character ?
	li	$s2,	48	#character 0
	li	$s3,	58	#character after 9
	li	$s4,	65	#character A
	li	$s5,	91	#character after Z
	li	$s6,	97	#character a
	li	$s7	123	#character after z
	j	finput		#first input has no blankspace on output
input:	li	$s0,	0
finput:	li	$v0,	12
	syscall
	beq	$v0,	$s1,	end
	move	$v1,	$v0
	blt	$v1,	$s2,	ptstar
	blt	$v1,	$s3,	ptnm
	blt	$v1,	$s4,	ptstar
	blt	$v1,	$s5,	ptup
	blt	$v1,	$s6,	ptstar
	blt	$v1,	$s7,	ptdn
	j	ptstar
ptnm:	la	$a0,	blk
	add	$a0,	$a0,	$s0
	li	$v0,	4
	syscall
	la	$a0,	nums
	sub	$v1,	$v1,	$s2
	li	$v0,	9
	mult	$v0,	$v1
	mflo	$v1
	add	$a0,	$a0,	$v1
	li	$v0,	4
	syscall
	j input
ptup:	la	$a0,	blk
	add	$a0,	$a0,	$s0
	li	$v0,	4
	syscall
	la	$a0,	upwds
	sub	$v1,	$v1,	$s4
	li	$v0,	9
	mult	$v0,	$v1
	mflo	$v1
	add	$a0,	$a0,	$v1
	li	$v0,	4
	syscall
	j input
ptdn:	la	$a0,	blk
	add	$a0,	$a0,	$s0
	li	$v0,	4
	syscall
	la	$a0,	dnwds
	sub	$v1,	$v1,	$s6
	li	$v0,	9
	mult	$v0,	$v1
	mflo	$v1
	add	$a0,	$a0,	$v1
	li	$v0,	4
	syscall
	j input
ptstar:	la	$a0,	blk
	add	$a0,	$a0,	$s0
	li	$v0,	4
	syscall
	la	$a0,	star
	li	$v0,	4
	syscall
	j	input
end:	

#It is said that a blank line makes the assembler happy