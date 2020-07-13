{ pkgs ? import <nixpkgs> {}
}:

let
  nix-hs =
    # import (pkgs.fetchFromGitHub {owner = "pjones"; repo = "nix-hs"; rev = "pjones/cabal2nix"; sha256 = "1vikbkg3wh5ngzdfilb6irbh6nqinf138qpdz8wz9izlvl8s36k4";}) { inherit pkgs; };
    # import (fetchGit "https://github.com/pjones/nix-hs.git") { inherit pkgs; };
    import (fetchGit {url="https://github.com/pjones/nix-hs.git";ref = "pjones/cabal2nix"; rev="38648346efbd48e4dae6d3beea4dd9154b6c3a9d";}) { inherit pkgs; };

in nix-hs {
  cabal = ./gf.cabal;
}
