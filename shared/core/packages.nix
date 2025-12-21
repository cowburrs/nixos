{
  config,
  pkgs,
  inputs,
  ...
}:
{
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
    dunst
    waybar
    rofi
    hyprshot
    hyprpicker
    hyprlock
    vesktop
    vlc
    hyprpolkitagent
    kdePackages.dolphin
    usbutils
    osu-lazer-bin
    kdePackages.okular
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
    krita
    nix-search-cli
    logseq
    p7zip
    obs-studio
    wlogout
    qdirstat
    lua
    stow
    ffmpeg
    libreoffice-qt
    wev
    screenfetch
	efibootmgr

    # Formatters
    ast-grep
    stylua
    prettier
    isort
    black
    zprint

    # LSP Servers
    lua-language-server
    nil
    nixd
    hyprls
  ];
}
