#include "textflag.h"

// Rust functions
GLOBL ·add_numbers(SB), NOPTR, $0
GLOBL ·process_bytes(SB), NOPTR, $0

// ARM64 calling convention:
// - Arguments: R0, R1, R2, R3, ...
// - Return value: R0
// - FP is frame pointer (R29)
// - LR is link register (R30)

// func asmAddNumbers(a, b int64) int64
TEXT ·asmAddNumbers(SB), NOSPLIT, $0-24
    MOVD a+0(FP), R0
    MOVD b+8(FP), R1

    BL   add_numbers(SB)

    // Return value
    MOVD R0, ret+16(FP)
    RET

// func asmProcessBytes(ptr unsafe.Pointer, len int) int64
TEXT ·asmProcessBytes(SB), NOSPLIT, $0-24
    MOVD ptr+0(FP), R0
    MOVD len+8(FP), R1

    BL   process_bytes(SB)

    // Return value
    MOVD R0, ret+16(FP)
    RET
