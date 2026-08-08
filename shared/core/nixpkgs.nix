{
  lib,
  pkgs-unstable,
  ...
}:
{
  # Allow funky licenses
  # nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "geogebra"
      "steam"
      "steam-unwrapped"
      "reaper"
      "vital"
      "davinci-resolve"
      "discord"
      "spotify"
      "nvidia-x11" # TODO: Isolate this to laptop
      "nvidia-settings"
      "nvidia-kernel-modules"
      "ltspice"
    ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
    "pnpm-10.29.2"
    "pnpm-9.15.9"
  ];
}
