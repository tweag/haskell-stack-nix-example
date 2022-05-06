let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
in

pkgs.mkShell {
  buildInputs = [
    pkgs.stack
  ];

  # Configure the Nix path to our own `pkgs`, to ensure Stack-with-Nix uses the correct one rather than the global <nixpkgs> when looking for the right `ghc` argument to pass in `nix/stack-integration.nix`
  # See https://nixos.org/nixos/nix-pills/nix-search-paths.html for more information
  NIX_PATH = "nixpkgs=" + pkgs.path;
}
