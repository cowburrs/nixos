{ config, pkgs, ... }:

{
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.zed-mono
    nerd-fonts.jetbrains-mono
    inter
    font-awesome
  ];
}
