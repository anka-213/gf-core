{ pkgs ? import <nixpkgs> {}
}:

let
  nix-hs =
    import (fetchGit "https://github.com/pjones/nix-hs.git") { inherit pkgs; };

in nix-hs {
  cabal = ./gf.cabal;
}
