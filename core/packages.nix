{ config, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.xserver.enable = true;
  services.displayManager.ly.enable = true;
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    kitty
    swaynotificationcenter
    playerctl
    wev
    dunst
    waybar
    ly
    rofi
    hyprshot
    hyprpicker
    hyprlock
    brightnessctl
    vesktop
    vlc
    syncthing
    hyprpolkitagent
    kdePackages.dolphin
    xppen_4
    usbutils
    osu-lazer-bin
    brightnessctl
    (discord.override {
      # withOpenASAR = true; # can do this here too
      withVencord = true;
    })
    kdePackages.okular
    brave
    # inputs.zen-browser.packages."${system}".default # beta
    neovim
    git
    wget
    wl-clipboard
    fzf
    eza
    networkmanagerapplet
    gcc
    nodejs_24
    python3
    cargo
    unzip
    zoxide
    ripgrep
    btop
    nixfmt
    fastfetch
    cava
    krita
    razergenie
    hyprpaper
    # bitwig-studio
  ];
  networking.firewall.enable = false;

  programs.kdeconnect.enable = true;
  xdg.portal.enable = true;
}
