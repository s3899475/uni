# quicksort an array of signed 32-bit integers
#
# arguments:
#
#   a0: starting address of the array
#   a1: start index of the region to be sorted
#   a2: end index of the region to be sorted
#
# returns:
#
#   n/a
.globl sort
.eqv t0_tmp t0
.eqv t6_tmp2 t6
#.eqv lo t1
#.eqv hi t2
.eqv t3_pivot t3
.eqv t4_addr1 t4
.eqv t5_addr2 t5
sort:
	# place your code here
	bge a1, a2, skip_sort # only run if lo < hi
	
	# push return address & make new frame
	sw ra, -4(sp)
	sw a0, -8(sp)
	sw a1, -12(sp)
	sw a2, -16(sp)

	jal partition # a0 set to p
	mv t0, a0

	sw t0, -20(sp) # store p
	addi sp, sp, -32 # stack frames should be multiples of 16?
	
	lw a0, 24(sp) # hmm
	lw a1, 20(sp)
	lw a2, 16(sp)
	
	addi a2, t0, -1 # hi = p - 1
	
	jal sort # recurse
	
	# get from stack
	lw a1, 20(sp)
	lw a2, 16(sp)
	lw t0, 12(sp)
	
	addi a1, t0, 1 # lo = p + 1
	
	jal sort # recurse
	
	# pop return address & free the frame
	lw ra, 28(sp)
	addi sp, sp, 32

skip_sort:

	ret # do not remove this line


# partition function
partition:
	# place your code here
	# word alignment is annoying - multiply by 4
	slli a1, a1, 2
	slli a2, a2, 2
	
	add t4_addr1, a0, a2
	lw t3_pivot, (t4_addr1) # pivot = A[hi]
	mv t1, a1 # counter (i) = lo
	mv t2, a1 # counter (j) = lo
	
loop:
	add t5_addr2, a0, t2
	lw t0_tmp, (t5_addr2) # tmp = A[j]
	
	# if A[j] < pivot, otherwise skip
	bge t0_tmp, t3_pivot, skip
	
	# swap A[i] and A[j]
	add t4_addr1, a0, t1
	lw t6_tmp2, (t4_addr1) # tmp2 = A[i]
	
	sw t6_tmp2, (t5_addr2)
	sw t0_tmp, (t4_addr1)
	
	addi t1, t1, 4 # increment i
	
skip:
	addi t2, t2, 4 # increment j
	blt t2, a2, loop
	# END LOOP

	
	# swap A[i] and A[hi]
	add t4_addr1, a0, t1
	lw t6_tmp2, (t4_addr1) # tmp2 = A[i]
	
	add t5_addr2, a0, a2
	lw t0_tmp, (t5_addr2) # tmp = A[hi]
	
	sw t6_tmp2, (t5_addr2)
	sw t0_tmp, (t4_addr1)
	
	mv a0, t1 # return i
	srli a0, a0, 2 # divide by 4 - un word align
        
	ret # do not remove this line
