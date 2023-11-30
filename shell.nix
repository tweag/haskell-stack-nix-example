let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };

  # Since we're already in a Nix shell, we need to wrap `stack` so that it
  # doesn't try to use Nix at all (but uses the GHC we provide in the shell)
  stack-wrapped = pkgs.symlinkJoin {
    name = "stack";
    paths = [ pkgs.stack ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/stack \
        --add-flags "\
          --system-ghc \
          --no-nix \
        "
    '';
  };

in
pkgs.mkShell {
  nativeBuildInputs = [
    # Needs to be kept in sync with the one that the current stack snapshot uses
    pkgs.haskell.compiler.ghc8107
    stack-wrapped
  ];

  buildInputs = [
    pkgs.zlib
  ];
}
