{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  # Allow funky licenses
  # nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
      "reaper"
      "vital"
      "davinci-resolve"
      "discord"
      "spotify"
      "nvidia-x11"
      "nvidia-settings"

    ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];
}
