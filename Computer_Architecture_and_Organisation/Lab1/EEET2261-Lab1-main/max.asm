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

max:
	# place your code here        
	mv a2, a0 # max number's address
	lw a3, (a0) # max number
        
	mv a4, a0 # current number's address
	# a5 - current number

loop:
	
	lw a5, (a4) # update current number
	
	ble a5, a3, skip # compare numbers - skip if not higher
	
	# load new max number
	mv a2, a4 # max number's address
	mv a3, a5 # max number
skip:
	
	addi a4, a4, 4 # increment current address by a word
	addi a1, a1, -1 # decrement counter
	
	bgtz a1, loop
	
	# put index into a0
	sub a0, a2, a0 # set a0 to max address minus start address
	srli a0, a0, 2 # divide by four
	
	ret # do not remove this line
        
