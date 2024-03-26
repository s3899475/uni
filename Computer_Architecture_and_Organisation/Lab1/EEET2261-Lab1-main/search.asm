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
.eqv t0_L t0
.eqv t1_R t1
.eqv t2_cur t2
.eqv t3_ptr t3

.globl search
search:
	# place your code here
	# initialize
	li t0_L, 0 # L = 0
	mv t1_R, a1 # R = n-1
	addi t1_R, t1_R, -1
	
	mv t3_ptr, a1
	
loop:
	bgt t0_L, t1_R, not_found # end loop if L > R
	
	# m = floor((L+R)/2)
	add t3_ptr, t0_L, t1_R
	srli t3_ptr, t3_ptr, 1
	
	# get current number's  address
	slli t2_cur, t3_ptr, 2 # multiply by 4 to word align
	add t2_cur, a0, t2_cur # convert to absolue address
	lw t2_cur, (t2_cur) # get current number
	
	# compare to target
	bgt t2_cur, a2, left  # cur > target: go left in array
	blt t2_cur, a2, right # cur < target: go right in array
	beq t2_cur, a2, end   # cur == target: finished
	
left:
	addi t1_R, t3_ptr, -1 # R = ptr - 1
	j loop
right:
	addi t0_L, t3_ptr, 1 # L = ptr + 1
	j loop
not_found:
	li a0, -1
	ret
end:
	mv a0, t3_ptr # return stored in a0
	ret # do not remove this line

