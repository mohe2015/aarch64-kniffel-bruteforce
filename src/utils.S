
// r0-r7 args and returns
arg0 .req x0
ret0 .req x0
arg1 .req x1
ret1 .req x1
arg2 .req x2
ret2 .req x2
arg3 .req x3
ret3 .req x3
arg4 .req x4
ret4 .req x4
arg5 .req x5
ret5 .req x5
arg6 .req x6
ret6 .req x6
arg7 .req x7
ret7 .req x7

warg0 .req w0
wret0 .req w0
warg1 .req w1
wret1 .req w1
warg2 .req w2
wret2 .req w2
warg3 .req w3
wret3 .req w3
warg4 .req w4
wret4 .req w4
warg5 .req w5
wret5 .req w5
warg6 .req w6
wret6 .req w6
warg7 .req w7
wret7 .req w7



// r8-r18 temporary registers
tmp0 .req x8
tmp1 .req x9
tmp2 .req x10
tmp3 .req x11
tmp4 .req x12
tmp5 .req x13
tmp6 .req x14
tmp7 .req x15
tmp8 .req x16
tmp9 .req x17
tmp10 .req x18

wtmp0 .req w8
wtmp1 .req w9
wtmp2 .req w10

// r19-r28 and sp must be preserved (callee-saved)
var0 .req x19
var1 .req x20
var2 .req x21
var3 .req x22
var4 .req x23
var5 .req x24
var6 .req x25
var7 .req x26
var8 .req x27
var9 .req x28

syscall .req x8