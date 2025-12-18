{ config, pkgs, ... }:
{
	# Packages
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
    kdePackages.okular
    brave
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
    hyprls
    stylua
    nix-search-cli
    ast-grep
    logseq
    lutris
    bitwig-studio
    ddcutil
    ddcui
    wezterm
    p7zip
    obs-studio
  ];

  programs.kdeconnect.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
