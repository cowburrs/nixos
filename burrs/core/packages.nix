{
  config,
  pkgs,
  inputs,
  pkgs-unstable,
  ...
}:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
  programs.obs-studio = {
    enable = true;
    # enableVirtualCamera = true;
    # ^^ its fucking bait don't ever use this bullshit. it overrides modprobe holy bait fuck you virtual camera you wasted multiple hours
    plugins = with pkgs.obs-studio-plugins; [
      droidcam-obs
      waveform
      obs-shaderfilter
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi # optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
      obs-livesplit-one
    ];
  };

  environment.systemPackages =
    with pkgs;
    [
      heroic
      lutris
      bitwig-studio
      ddcutil
      brave
      blender
      reaper
      vital
      mesa-demos
      # Eye candy
      terminaltexteffects
      cava
      gum
      mangohud
      wine
      pipes
      cmatrix
      discord-rpc

      godot
      droidcam
      lshw # Installed for davincibox
      davinci-resolve
      steamtinkerlaunch
      # gowall
      ani-cli
      figlet
      audacious
			lsp-plugins
    ]
    ++ (with pkgs-unstable; [
      tetrio-desktop
      lunar-client
      mesa
      osu-lazer-bin
      # (tetrio-desktop.override { withTetrioPlus = true; }) # currently broken
    ]);
}
