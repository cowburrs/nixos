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
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  nix.registry.nixpkgs-unstable.flake = nixpkgs-unstable;
  nix.settings.auto-optimise-store = true;
}
