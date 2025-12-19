{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        keyboardShortcut
        fullAppDisplay
        volumePercentage
        copyLyrics
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        ncsVisualizer
        marketplace
      ];
      enabledSnippets = with spicePkgs.snippets; [
        rotatingCoverart
        pointer
      ];

      theme = spicePkgs.themes.comfy;
      # theme = spicePkgs.themes.catppuccin;
      # colorScheme = "macchiato";
    };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Packages
  environment.systemPackages = with pkgs; [
    (inputs.yazi.packages.${pkgs.system}.default.override {
      _7zz = pkgs._7zz-rar; # Support for RAR extraction
    })
    inputs.zen-browser.packages.${pkgs.system}.default
    kitty
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
    hyprls
    nix-search-cli
    ast-grep
    logseq
    lutris
    bitwig-studio
    ddcutil
    wezterm
    p7zip
    obs-studio
    wlogout
    qdirstat
    lua
    stylua
    ast-grep
    prettier
    isort
    black
    stow
    heroic
    lutris
  ];
}
