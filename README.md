# Stack + Nix integration

This branch supports our [Smooth, non-invasive Haskell Stack and Nix shell integration](https://www.tweag.io/blog/2022-06-02-haskell-stack-nix-shell/) blog post by showcasing a working Haskell Stack + Nix shell integration.

```shell
$ nix-shell
[nix-shell]$ stack build
```

You can use a tool like [niv](https://github.com/nmattia/niv#tracking-a-nixpkgs-branch) to manage and update the `nixpkgs` version.

```shell
$ niv update nixpkgs
```
