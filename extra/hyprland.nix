{ config, pkgs, ...}:
{
programs.hyprland = {
enable = true;
xwayland.enable = true;
};
services.xserver.enable = true;
services.displayManager.ly.enable = true;
environment.systemPackages = with pkgs;[
	kitty
	dunst
	waybar
	ly
	rofi
		hyprshot
];
xdg.portal.enable = true;
	fonts.packages = with pkgs; [

		nerd-fonts.zed-mono
		nerd-fonts.jetbrains-mono
		jetbrains-mono
inter
	];
}
