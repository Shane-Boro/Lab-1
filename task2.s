.section .bss
.globl ram
.lcomm ram, 256 # Reserve 256 bytes of RAM

.section .text
.globl fill_ram # Visible to C driver[cite: 1]

fill_ram:
    # Set base pointer to ram array using position-independent lea
    lea ram(%rip), %rdi
    movq $0x50, %rcx # Start offset at 0x50

fill_loop:
    movb $0xFF, (%rdi, %rcx) # Store FFh at ram + offset[cite: 1]
    incq %rcx # Increment offset[cite: 1]
    cmpq $0x58, %rcx # Compare offset to 0x58[cite: 1]
    jle fill_loop # Loop until offset > 0x58[cite: 1]
    ret

.section .note.GNU-stack,"",@progbits
