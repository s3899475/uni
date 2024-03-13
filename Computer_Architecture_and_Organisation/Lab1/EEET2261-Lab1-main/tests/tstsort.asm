# tstsort.asm - RARS test harness for sort.asm

# 2020-07-18 - Shaun L. Cloherty <shaun.cloherty@rmit.edu.au>

.globl  main

.macro exit
        li    a7,10
        ecall
.end_macro

.data
.include "random.data"          # defines data and n

.text
main:
        la    a0, data          # address of the data vector
        add   a1, x0, x0        # start index
        lw    a2, n             # number of elements in the data vector
        addi  a2, a2, -1        # end index
        jal   ra, sort          # call sort()
        exit                    # exit

.include "../sort.asm"