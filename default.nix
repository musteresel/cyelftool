let nixpkgs = import <nixpkgs> {};
in
{
  lib ? nixpkgs.lib
, stdenv ? nixpkgs.stdenv
, cmake ? nixpkgs.cmake
, libelf ? nixpkgs.libelf
}:

stdenv.mkDerivation rec {
  pname = "cyelftool";
  version = "UNSPECIFIED";

  src = ./.;

  enableParallelBuilding = true;

  buildInputs = [cmake libelf];

  cmakeFlags = ["DLIBELF_DIR=${libelf}"];
}
