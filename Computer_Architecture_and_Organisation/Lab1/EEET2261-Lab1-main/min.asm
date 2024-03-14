# minimum value in an array of signed 32-bit integers
#
# arguments:
#
#   a0: starting address of the array
#   a1: number of integers in the array
#
# returns:
#
#   a0: index of the minimum value in the supplied array
.eqv t0_min_addr t0
.eqv t1_min t1
.eqv t2_cur_addr t2
.eqv t3_cur t3

.globl min
min:
	# place your code here
	mv t0_min_addr, a0 # min number's address
	lw t1_min, (a0) # min number
        
	mv t2_cur_addr, a0 # current number's address
	# a5 - current number

loop:
	
	lw t3_cur, (t2_cur_addr) # update current number
	
	bge t3_cur, t1_min, skip # compare numbers - skip if not lower
	
	# load new min number
	mv t0_min_addr, t2_cur_addr # min number's address
	mv t1_min, t3_cur # min number
skip:
	
	addi t2_cur_addr, t2_cur_addr, 4 # increment current address by a word
	addi a1, a1, -1 # decrement counter
	
	bgtz a1, loop
	
	# put index into a0
	sub a0, t0_min_addr, a0 # set a0 to min address minus start address = index * 4
	srli a0, a0, 2 # divide by four

	ret # do not remove this line
