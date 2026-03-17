{
  config,
  lib,
  pkgs,
	inputs,
  ...
}:
{
# This is necessary for millenium
	nixpkgs.overlays = [ inputs.millennium.overlays.default ];
}
