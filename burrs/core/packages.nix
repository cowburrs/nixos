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
    ]
    ++ (with pkgs-unstable; [
      tetrio-desktop
	  lunar-client
      # (tetrio-desktop.override { withTetrioPlus = true; }) # currently broken
    ]);
}
