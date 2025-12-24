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
  boot.kernelModules = [ "v4l2loopback" ];
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
          rev = "main";
          sha256 = "sha256-5aR1b/4/NhJlnXtz4Un0kDzatl7BHLHRDCavj6QjKVk=";
        };
      in
      smth + "/themes/navi";
	  timeout = 10;

  };

}
