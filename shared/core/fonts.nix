{ config, pkgs, ... }:

{
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # you don't need actual jetbrains mono afaik if you have this font
    aporetic
		fantasque-sans-mono
		noto-fonts
		comfortaa
		public-sans # The university font
  ];
}
