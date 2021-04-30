# arm64-kniffel-bruteforce

```bash
nix develop
aarch64-linux-gnu-gcc -Og -g -ggdb src/main.S ; ./a.out ; echo $?
```

## GDB settings

```
#layout src
layout regs
x/8xg $sp
```