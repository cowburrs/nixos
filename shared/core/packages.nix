{
  config,
  pkgs,
  inputs,
	nixpkgs,
  ...
}:
{
  programs.hyprland = {
    enable = true;
    # withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled.
  };

  programs.firefox = {
    enable = true;
    # You can use lockPref, defaultPref and Pref
    # autoConfig = '''';
    # autoConfigFiles = [
    #   /home/burrs/.config/firefox/autoConfig.js
    # ];
    autoConfig = builtins.readFile /home/burrs/.config/firefox/autoConfig.js;
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
			# Colourschemes here: https://github.com/Comfy-Themes/Spicetify/blob/main/Comfy/color.ini
      colorScheme = "catppuccin-macchiato";

      # theme = spicePkgs.themes.catppuccin;
      # colorScheme = "macchiato";
    };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    (inputs.yazi.packages.${pkgs.system}.default.override {
      _7zz = pkgs._7zz-rar; # Support for RAR extraction
    })
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    kitty
    playerctl
    mako
    waybar
    rofi
    hyprshot
    hyprpicker
    hyprlock
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
    wlogout
    qdirstat
    lua
    stow
    ffmpeg
    libreoffice-qt
    wev
    screenfetch
    hyprcursor

    # Formatters
    ast-grep
    stylua
    prettier
    isort
    black
    zprint
    jsonfmt
    biome

    # LSP Servers
    lua-language-server
    nil
    nixd
    hyprls

    nethogs
    efibootmgr
    music-discord-rpc
    (discord.override {
      withOpenASAR = true; # can do this here too
      withVencord = true;
    })
    wttrbar
    wezterm
    waybar-mpris

    # One day make the debug stuff a shell, so that it doesn't have to bloat everything
    libnotify
    speedtest-cli
    mission-center

    r2modman
		trash-cli
  ];
}
