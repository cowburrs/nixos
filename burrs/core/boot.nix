{
  config,
  lib,
  pkgs,
  ...
}:
{
  # OBS
  boot.kernelPackages = pkgs.linuxPackages_latest; # TODO: Maybe use zen here idk
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=5 \
      video_nr=1,2,3 \
      card_label="DroidCam,OBS Cam,Random" \
      exclusive_caps=1
  '';
}
