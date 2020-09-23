pkgs: oldpkgs: {
  haskellPackages = oldpkgs.haskellPackages.override {
    overrides = haskellPackagesNew: haskellPackagesOld:
     with oldpkgs.haskell.lib;
     {
      # site = haskellPackagesNew.callPackage ./site.nix {};
      gf-core = overrideCabal (haskellPackagesNew.callPackage ./gf-core.nix {}) (old: {
        configureFlags = "-f c-runtime";
        # jailbreak = true; # jailbreak dependecies
        librarySystemDepends = [ pkgs.gf-pgf ];
      });
      # gf-core = haskellPackagesNew.callPackage ./gf-core-c.nix {};
      # gf-c-bindings = haskellPackagesNew.callPackage ./haskell-bind.nix {};
      gf-c-bindings = overrideCabal (haskellPackagesNew.callPackage ./haskell-bind.nix { gu = null; pgf = null; }) (old: {
        librarySystemDepends = [ pkgs.gf-pgf ];
      });
    };
  };
  gf-pgf = pkgs.callPackage ./c-runtime.nix {};
}