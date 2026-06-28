{
  pkgs,
  inputs,
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
  environment.pathsToLink = [ "/share/hypr" ];
  programs.bookmarks.enable = true;

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
  programs.gdk-pixbuf.modulePackages = [ pkgs.librsvg ]; # You need this for wlogout

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };
  programs.yazi = {
    enable = true;
    plugins = {
      git = (with pkgs.yaziPlugins; git);
      relative-motions = (with pkgs.yaziPlugins; relative-motions);
      full-border = (with pkgs.yaziPlugins; full-border);
      smart-enter = (with pkgs.yaziPlugins; smart-enter);
      bookmarks = "${inputs.bookmarks}/bookmarks.yazi";
      jump-to-char = (with pkgs.yaziPlugins; jump-to-char);
    };
    initLua = ../../resources/misc/yazi/init.lua;
    settings = {
      theme = (lib.importTOML ../../resources/misc/yazi/theme.toml) // {
        mgr.syntect_theme = ../../resources/misc/yazi/flavors/catppuccin-macchiato.yazi/tmtheme.xml;
      };
      yazi = (lib.importTOML ../../resources/misc/yazi/yazi.toml);
      keymap = (lib.importTOML ../../resources/misc/yazi/keymap.toml);
    };
  };

  programs.kdeconnect.enable = true;
  # Packages
  environment.systemPackages =
    with pkgs;
    [
      inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
      # inputs.bookmarks.packages.${pkgs.system}.default
      playerctl
      mako
      waybar
      rofi
      hyprshot
      hyprpicker
      hyprlock
      hyprpolkitagent
      kdePackages.dolphin
      usbutils
      kdePackages.okular
      neovim
      (lib.hiPrio (
        pkgs.runCommand "nvim.desktop-hide" { } ''
          mkdir -p "$out/share/applications"
          cat "${pkgs.neovim}/share/applications/nvim.desktop" > "$out/share/applications/nvim.desktop"
          echo "Hidden=1" >> "$out/share/applications/nvim.desktop"
        ''
      )) # so that neovim doesnt have the stupid desktop
      git
      wl-clipboard
      fzf
      eza
      networkmanagerapplet
      ripgrep
      btop
      nixfmt
      fastfetch
      krita

      p7zip
      wlogout
      qdirstat
      stow
      ffmpeg
      libreoffice-qt
      wev
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
      nixd

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
      proton-vpn
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
      hunspellDicts.en-au

      taplo
      anki
      pandoc
      zotero
      zbar
      bitwarden-cli
      bitwarden-desktop
      geogebra6
      git-lfs
      wlrctl
      (qutebrowser.overridePythonAttrs (old: {
        dependencies = old.dependencies ++ [ python3.pkgs.requests ];
      }))
      (python3.withPackages (ps: [ ps.requests ]))
    ]
    ++ (with pkgs-unstable; [
      tetrio-desktop
      hyprshutdown
      logseq
    ]);
}
