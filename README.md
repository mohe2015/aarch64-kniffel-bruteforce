# arm64-kniffel-bruteforce

```bash
nix develop
aarch64-linux-gnu-gcc -Wall -Wextra -Og -g -ggdb src/main.S && ./a.out ; echo $?
```

## GDB settings

```
#layout src
layout regs
x/8xg $sp
```

## Super simple random test

```
./a.out | grep 0000 > statistics # quite slow run for a few minutes
awk '{ a[$0]++ } END{ for(x in a) print a[x], x }' statistics | sort

./a.out > result
sort result | uniq -c | sort -nr
```

## Profiling

https://valgrind.org/docs/manual/manual.html
https://valgrind.org/docs/manual/cl-manual.html

```bash
valgrind --tool=callgrind --cache-sim=yes --branch-sim=yes --dump-instr=yes --collect-jumps=yes ./a.out

ssh -X -A pi@raspberrypi.local

```