{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Systemd(Crazy that you can switch)
  boot.loader.systemd-boot.enable = false;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # OBS
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=4 \
      video_nr=1,2 \
      card_label="DroidCam,OBS Cam" \
      exclusive_caps=1
  '';
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev"; # idk what it means but its on the wiki
    efiInstallAsRemovable = true;
    configurationLimit = 5;
    theme =
      let
        smth = pkgs.fetchFromGitHub {
          owner = "cowburrs";
          repo = "p5rgrub";
          rev = "5f8fc1b5bb84c0d065ff4ef60f9ac9f3816fdf92";
          sha256 = "sha256-XWJ98omIMQSwsZqVF/bgJVIKPpr1o6nhERwVP2y7TB8=";
          # sha256 = lib.fakeHash;
        };
      in
      smth + "/themes/navi";
    timeout = 10;

  };

}
