    { config, pkgs, ... }:

    {
      fonts.fontDir.enable = true;
      fonts.packages = with pkgs; [
        jetbrains-mono
      ];
    }
