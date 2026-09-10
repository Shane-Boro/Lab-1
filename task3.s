.section .bss
.global ram
.lcomm ram, 256 # Reserve 256 bytes of Ram[cite:1]

.section .text
.globl fill_ram # Visible to C driver[cite:1]

fill_ram:
    # Clear RAM locations 0x50 through 0x58[cite:1]
    lea ram(%rip), %rcx
    movq $0x50, %rcx

clear_loop:
    movb $0x00, (%rbx, %rcx) # Store 0x00 at ram offset[cite:1]
    incq %rcx # Increment offset[cite:1]
    cmpq $0x58, %rcx # Compare offset to 0x58[cite:1]
    jle clear_loop # Loop until offset > 0x58 [cite:1]
    ret

.section .note.GNU-stack,"",@progbits
