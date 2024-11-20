#include "textflag.h"

// Rust functions
GLOBL ·add_numbers(SB), NOPTR, $0
GLOBL ·process_bytes(SB), NOPTR, $0

// func asmAddNumbers(a, b int64) int64
TEXT ·asmAddNumbers(SB), NOSPLIT, $0-24
    MOVQ a+0(FP), DI
    MOVQ b+8(FP), SI
    CALL add_numbers(SB)
    MOVQ AX, ret+16(FP)
    RET

// func asmProcessBytes(ptr unsafe.Pointer, len int) int64
TEXT ·asmProcessBytes(SB), NOSPLIT, $0-24
    MOVQ ptr+0(FP), DI
    MOVQ len+8(FP), SI
    CALL process_bytes(SB)
    MOVQ AX, ret+16(FP)
    RET
