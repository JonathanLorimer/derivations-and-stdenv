{
  perSystem = {pkgs, system, ...}: {
    packages = {
      deriv = import ./deriv.nix { inherit system pkgs; };
      deriv-js = import ./deriv-js.nix { inherit system pkgs; };
    };
  };
}
