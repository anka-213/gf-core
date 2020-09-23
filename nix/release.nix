let
  myOverlay = 
     pkgs: oldpkgs: {
      haskellPackages = oldpkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: {
          # site = haskellPackagesNew.callPackage ./site.nix {};
          # gf-core = (haskellPackagesNew.callPackage ./gf-core.nix {}).overrideAttrs(old: {
          #   configureFlags = "-f c-runtime";
          #   # jailbreak = true; # jailbreak dependecies
          # });
          gf-core = haskellPackagesNew.callPackage ./gf-core-c.nix {};
          gf-c-bindings = haskellPackagesNew.callPackage ./haskell-bind.nix {};
        };
      };
      gf-pgf = pkgs.callPackage ./c-runtime.nix {};
    };
  
  pkgs = import <nixpkgs> { overlays = [ myOverlay]; };
# in pkgs.haskellPackages.gf-core
# in pkgs.asdfasdf
in {
  inherit (pkgs) gf-pgf;
  inherit (pkgs.haskellPackages) gf-core gf-c-bindings;
}
