# binary search an array of signed 32-bit integers
#
# arguments:
#
#   a0: starting address of the array
#   a1: number of integers in the array
#   a2: target of the search
#
# returns:
#
#   a0: index of the target (or -1)
.globl search
.eqv t0_offset t0
.eqv t1_cur_addr t1
.eqv t2_cur t2
.eqv t3_base t3
search:
	# place your code here
	mv t3_base, a0
loop:
	# divide by 2
	srli a1, a1, 1
	# stop if equal to zero - not found
	beqz a1, not_found
	# compare current and target
	slli t0_offset, a1, 2 # convert to byte offset (from word offset)
	add t1_cur_addr, t3_base, t0_offset # get addr of current
	lw t2_cur, (t1_cur_addr) # get value of current
	
	bgt t2_cur, a2, left  # cur > target: go left
	blt t2_cur, a2, right # cur < target: go right
	beq t2_cur, a2, end   # cur == target: finished
	
left:
	sub t3_base, t3_base, t0_offset
	j loop
right:
	add t3_base, t3_base, t0_offset
	j loop
end:
	sub a0, t1_cur_addr, a0 # get index * 4
	srli a0, a0, 2 # divide by 4
	ret # do not remove this line
not_found:
	li a0, -1
	ret
