{ pkgs ? import <nixpkgs> {}
}:

let
  nix-hs =
    import (fetchFromGithub {owner = "pjones"; repo = "nix-hs"; rev = "pjones/cabal2nix";}) { inherit pkgs; };
    # import (fetchGit "https://github.com/pjones/nix-hs.git") { inherit pkgs; };

in nix-hs {
  cabal = ./gf.cabal;
}
