{ mkDerivation, base, containers, gf-pgf, pretty, stdenv }:
mkDerivation {
  pname = "pgf2";
  version = "1.2.0";
  src = ../src/runtime/haskell-bind;
  libraryHaskellDepends = [ base containers pretty ];
  librarySystemDepends = [ gf-pgf ];
  homepage = "https://www.grammaticalframework.org";
  description = "Bindings to the C version of the PGF runtime";
  license = stdenv.lib.licenses.lgpl3;
}
