{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, hsp, stdenv, text, web-routes }:
      mkDerivation {
        pname = "web-routes-hsp";
        version = "0.24.6.1";
        src = ./.;
        libraryHaskellDepends = [ base hsp text web-routes ];
        description = "Adds XMLGenerator instance for RouteT monad";
        license = stdenv.lib.licenses.bsd3;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
