
// r0-r7 args and returns
arg0 .req x0
ret0 .req x0
arg1 .req x1
ret1 .req x1
arg2 .req x2
ret2 .req x2

// r8-r18 temporary registers
tmp0 .req x8
tmp1 .req x9
tmp2 .req x10
// r19-r28 and sp must be preserved (callee-saved)

syscall .req x8