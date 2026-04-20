{
  config,
  pkgs,
  inputs,
  nixpkgs,
  pkgs-unstable,
  lib,
  ...
}:
{
  programs.hyprland = {
    # withUWSM = true; # recommended for most users
    enable = true;
    xwayland.enable = true; # Xwayland can be disabled.
    package = pkgs-unstable.hyprland;
    portalPackage = pkgs-unstable.xdg-desktop-portal-hyprland;
  };

  # programs.nix-ld.enable = true; # Not the nix way ig, its ok i don't need it atm

  programs.firefox = {
    enable = true;
    autoConfig = builtins.readFile ../../resources/autoConfig.js;
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

      # theme = spicePkgs.themes.text;
      # # # Colourschemes here: https://github.com/spicetify/spicetify-themes/blob/e58220adfeffd1b87fa129003609d530a4e5925b/text/color.ini
      # colorScheme = "CatppuccinMacchiato";

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
  environment.systemPackages =
    with pkgs;
    [
      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
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
      # python
      # (pkgs.python3.withPackages (
      #   python-pkgs: with python-pkgs; [
      #     pyserial
      #     holidays
      #     pyqt6
      #     uncertainties
      #     pint
      #     pandas
      #     matplotlib
      #     numpy
      #     odfpy
      #   ]
      # ))
      cargo
      unzip
      zoxide
      ripgrep
      btop
      nixfmt
      fastfetch
      krita
      (logseq.override { electron = electron_39; })

      p7zip
      wlogout
      qdirstat
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
      zprint
      jsonfmt
      biome

      # LSP Servers
      lua-language-server
      nil
      nixd
      hyprls

      nethogs
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

      trash-cli
      thunderbird
      tldr
      v4l-utils
      easyeffects
      neomutt
      jq # for muting specific active windows in hyrpalnd
      tesseract
      imagemagick
      beautysh
      libnotify
      hyprpaper
      rofi-network-manager
      glib
      kdePackages.qt6ct
      nh
      mpv
      gh
      rustc
      rust-analyzer
      rustfmt
      protonvpn-gui
      icu
      sox
      gitsnip
      rpl

      chromium
      cryfs
      xournalpp
      arduino-ide
      arduino-cli
      arduino-language-server
      appimage-run
      arduino
      timer
      hunspell
      hunspellDicts.en-au
      # viddy
      # gum
      clang-tools
      taplo
		fixjson
    ]
    ++ (with pkgs-unstable; [
      yazi
      tetrio-desktop
    ]);
}
