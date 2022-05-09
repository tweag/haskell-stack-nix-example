# Stack + Nix integration

This branch showcases the optimistic approach of providing Stack in the Nix shell without further configuration.

The problem with this approach is that Stack provides its own GHC, which is unaware of other system dependencies provided by `shell.nix`, like `zlib`.

```shell
$ nix-shell
[nix-shell]$ stack build
[...]
zlib > configure
zlib > Configuring zlib-0.6.2.3...
zlib > Cabal-simple_mPHDZzAJ_3.2.1.0_ghc-8.10.7: Missing dependency on a foreign
zlib > library:
zlib > * Missing (or bad) header file: zlib.h
zlib > * Missing (or bad) C library: z
zlib > This problem can usually be solved by installing the system package that
zlib > provides this library (you may need the "-dev" version). [...]
```

