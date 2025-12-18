{
  config,
  lib,
  pkgs,
  ...
}:
{
  nix = {
    settings = {
      substitute = true;
      substituters = [ "https://yazi.cachix.org" ];
      trusted-public-keys = [ "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k=" ];
    };
  };
  # This doesn't work
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than +3";
}
