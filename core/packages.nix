{ config, pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.xserver.enable = true;
  services.displayManager.ly.enable = true;
  environment.systemPackages = with pkgs; [
    kitty
    swaynotificationcenter
    waybar
    ly
    rofi
    hyprshot
    hyprpicker
    brightnessctl
    vesktop
    vlc
    syncthing
    hyprpolkitagent
    # inputs.zen-browser.packages."${system}".default # beta
  ];
  networking.firewall.enable = false;

  programs.kdeconnect.enable = true;
  xdg.portal.enable = true;
}
