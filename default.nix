{ mkDerivation, base, hsp, stdenv, text, web-routes }:
mkDerivation {
  pname = "web-routes-hsp";
  version = "0.24.6.1";
  src = ./.;
  libraryHaskellDepends = [ base hsp text web-routes ];
  description = "Adds XMLGenerator instance for RouteT monad";
  license = stdenv.lib.licenses.bsd3;
}
