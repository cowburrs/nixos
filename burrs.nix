# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
        /etc/nixos/hardware-configuration.nix # Fuck i don't care, fuck purity, this is the most elegant solution, although its not 'pure' its literally best practice.
  ]
  ++ lib.filesystem.listFilesRecursive ./shared/core/.
  ++ lib.filesystem.listFilesRecursive ./shared/extra/.
  ++ lib.filesystem.listFilesRecursive ./burrs/core/.
  ++ lib.filesystem.listFilesRecursive ./burrs/extra/.;

  # Dont change this.
  system.stateVersion = "25.11"; # Did you read the comment?
}
