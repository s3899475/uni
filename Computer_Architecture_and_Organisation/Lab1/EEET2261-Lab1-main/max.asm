# maximum value in an array of signed 32-bit integers
#
# arguments:
#
#   a0: starting address of the array
#   a1: number of integers in the array
#
# returns:
#
#   a0: index of the maximum value in the supplied array
.globl max
.eqv t0_max_addr t0
.eqv t1_max t1
.eqv t2_cur_addr t2
.eqv t3_cur t3
max:
	# place your code here
	mv t0_max_addr, a0 # max number's address
	lw t1_max, (a0) # max number
        
	mv t2_cur_addr, a0 # current number's address
	# a5 - current number

loop:
	
	lw t3_cur, (t2_cur_addr) # update current number
	
	ble t3_cur, t1_max, skip # compare numbers - skip if not higher
	
	# load new max number
	mv t0_max_addr, t2_cur_addr # max number's address
	mv t1_max, t3_cur # max number
skip:
	
	addi t2_cur_addr, t2_cur_addr, 4 # increment current address by a word
	addi a1, a1, -1 # decrement counter
	
	bgtz a1, loop
	
	# put index into a0 - return value register
	sub a0, t0_max_addr, a0 # set a0 to max address minus start address = index * 4
	srli a0, a0, 2 # divide by four
	
	ret # do not remove this line
        
