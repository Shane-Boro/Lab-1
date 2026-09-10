.section .bss
.globl ram
.lcomm ram, 256 # Reserve 256 bytes of RAM[cite: 1]

.section .text
.globl fill_ram # Visible to C driver[cite: 1]

fill_ram:
    xorb %al, %al # Clear AL to hold accumulated sum (0)[cite: 1]
    movb $1, %bl # Counter starting at 1

sum_loop:
    addb %bl, %al # AL = AL + BL[cite: 1]
    incb %bl # BL = BL + 1[cite: 1]
    cmpb $10, %bl # Compare counter with N=10[cite: 1]
    jle sum_loop # Loop back while BL <= 10[cite: 1]

    # Store final sum into RAM location 0x50[cite: 1]
    movb %al, ram+0x50
    ret

.section .note.GNU-stack,"",@progbits
