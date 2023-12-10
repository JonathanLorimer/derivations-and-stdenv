{ system, pkgs }:
derivation {
  inherit system;
  name = "deriv";
  args = [ ./builders/deriv.sh "arg1" "arg2" ];
  builder = "${pkgs.bash}/bin/bash";
  coreutils = pkgs.coreutils;
  outputs = ["lib" "out"];
  OUR_ENV_VAR = "our env value!!!!";
}
