{ config, pkgs, ...}:
{
programs.hyprland = {
enable = true;
xwayland.enable = true;
};
services.xserver.enable = true;
services.displayManager.ly.enable = true;
environment.systemPackages = [
	pkgs.kitty
	pkgs.dunst
	pkgs.waybar
	pkgs.ly
	pkgs.rofi
];
xdg.portal.enable = true;
}
