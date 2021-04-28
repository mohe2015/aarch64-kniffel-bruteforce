// https://sourceware.org/binutils/docs-2.36/as/index.html
// https://modexp.wordpress.com/2018/10/30/arm64-assembly/
// First this will only be a program to play kniffel, not to predict anything
//.include "include.inc"

        .struct 0
field1:
        .struct field1 + 4
field2:
        .struct field2 + 4
field3:

.text

.global main

main:
    return_value .req x0
    mov return_value, 10
    .unreq return_value
    ret
