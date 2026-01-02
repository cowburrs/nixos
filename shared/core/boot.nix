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
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
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
          owner = "SiriusAhu";
          repo = "Persona_5_Royal_Grub_Themes";
          rev = "07f4660631d6002aafe9f14dfa77849e979477ac";
          sha256 = "sha256-5aR1b/4/NhJlnXtz4Un0kDzatl7BHLHRDCavj6QjKVk=";
        };
      in
      smth + "/themes/navi";
    timeout = 10;

  };

}
