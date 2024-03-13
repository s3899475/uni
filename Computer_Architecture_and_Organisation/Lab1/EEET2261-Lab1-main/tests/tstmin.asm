# tstmin.asm - RARS test harness for min.asm

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
        lw    a1, n             # number of elements in the data vector
        jal   ra, min           # call min()
        exit                    # exit

.include "../min.asm"