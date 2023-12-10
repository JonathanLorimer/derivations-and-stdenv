{ system, pkgs }:
derivation {
  inherit system;
  name = "deriv-js";
  args = [ ./builders/deriv.js];
  builder = "${pkgs.nodejs_21}/bin/node";
  cowsay = pkgs.neo-cowsay;
  __structuredAttrs = true;
}
