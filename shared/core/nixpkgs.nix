{
  config,
  lib,
  pkgs,
	inputs,
  ...
}:
{
  # Allow funky licenses
  nixpkgs.config.allowUnfree = true;
}
