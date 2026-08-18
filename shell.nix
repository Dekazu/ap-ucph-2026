let
  # Pinning nixpkgs for reproducibility. If you want to use your
  # system Nixpkgs, use the other definition of 'nixpkgs' that is
  # commented out below.
  nixpkgs = builtins.fetchTarball {
    url = https://github.com/NixOS/nixpkgs/archive/refs/tags/26.05.tar.gz;
    sha256 = "sha256:0am8xx09fx5yf2p0wb001v0jx1g5hrfb76h4r37xph378jgk7pcr";
  };
  # nixpkgs = <nixpkgs>;

  pkgs = import nixpkgs {};
in
pkgs.stdenv.mkDerivation {
  name = "AP2026";
  buildInputs =
    with pkgs;
    [
      haskell.compiler.ghc912
      cabal-install
      haskell-language-server
    ];
}
