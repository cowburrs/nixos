{
  config,
  lib,
  pkgs,
  nixpkgs-unstable,
  ...
}:
{
  nix.settings = {
    substitute = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  nix.registry.nixpkgs-unstable.flake = nixpkgs-unstable;
  nix.settings.auto-optimise-store = true;
}
