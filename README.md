# Stack + Nix integration

This branch showcases the invasive approach of using Stack+Nix integration.

```shell
$ nix-shell
[nix-shell]$ stack build
```

The problem with this approach is:
* Either we modify `stack.yaml` (this is what we did in this branch) to pass the various Nix options, but now non-Nix users can no longer build it
* Or we don't modify `stack.yaml` and Nix users must pass the various flags in the CLI every time, e.g.:
  ```shell
  $ nix-shell
  [nix-shell]$ stack --nix --no-nix-pure --nix-shell-file=nix/stack-integration.nix build
  ```

