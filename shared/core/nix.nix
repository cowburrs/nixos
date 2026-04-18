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
    substituters = [ "https://yazi.cachix.org" ];
    trusted-public-keys = [ "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k=" ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  nix.registry.nixpkgs-unstable.flake = nixpkgs-unstable;
  nix.settings.auto-optimise-store = true;
}
