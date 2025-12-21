{
  config,
  lib,
  pkgs,
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
  nix.settings.auto-optimise-store = true;

  nix.gc.automatic = true;

  nix.gc.dates = "daily";

  nix.gc.options = "--delete-older-than +5";
}
