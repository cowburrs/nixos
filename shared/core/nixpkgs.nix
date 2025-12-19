{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Allow funky licenses
  nixpkgs.config.allowUnfree = true;
}
