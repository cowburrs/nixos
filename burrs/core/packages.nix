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
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      droidcam-obs
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
      kdePackages.kdenlive
      # Eye candy
      terminaltexteffects
      cava
      gum
      mangohud
      wine
      discord-rpc

      godot-mono
      droidcam
      lshw # Installed for davincibox
      davinci-resolve
			steamtinkerlaunch
    ]
    ++ (with pkgs-unstable; [
      tetrio-desktop
      lunar-client
      mesa
      # (tetrio-desktop.override { withTetrioPlus = true; }) # currently broken
    ]);
}
