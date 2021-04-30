# arm64-kniffel-bruteforce

```bash
nix develop
aarch64-unknown-linux-gnu-gcc src/main.S ; ./a.out ; echo $?
```

## GDB settings

```
layout src
layout regs
```