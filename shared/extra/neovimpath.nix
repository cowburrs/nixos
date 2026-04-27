{ config, pkgs, ... }:
{
  environment.systemPackages =
    let
      nvim-xdg = pkgs.writeShellScriptBin "nvim-xdg" ''
        file="$1"
        file="''${file#file://}"
        wezterm start -- nvim "$file"
      '';

      nvim-xdg-desktop = pkgs.makeDesktopItem {
        name = "nvim-xdg";
        desktopName = "Neovim (WezTerm)";
        exec = "${nvim-xdg}/bin/nvim-xdg %f";
        mimeTypes = [
          "text/markdown"
          "text/plain"
        ];
        type = "Application";
      };
    in
    [
      nvim-xdg-desktop
    ];
}
