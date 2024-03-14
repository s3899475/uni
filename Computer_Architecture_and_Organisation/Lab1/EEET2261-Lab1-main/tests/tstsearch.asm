# tstsearch.asm - RARS test harness for search.asm

# 2020-07-18 - Shaun L. Cloherty <shaun.cloherty@rmit.edu.au>

.globl  main

.macro exit
        li    a7,10
        ecall
.end_macro

.data
.include "sorted.data"          # defines data and n

.text
main:
        la    a0, data          # address of the data vector
        lw    a1, n             # number of elements in the data vector
        slli  a2, a1, 2
        add   a2, a0, a2
        lw    a2, -4(a2)        # the search target (here, the last element in the data vector)
        #addi  a2, a2, 1
        jal   ra, search        # call search()
        exit                    # exit

#.include "../search.asm"
