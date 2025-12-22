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
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev"; # idk what it means but its on the wiki
    efiInstallAsRemovable = true;
    theme = pkgs.fetchFromGitHub {
      owner = "cowburrs";
      repo = "p5rgrub";
      rev = "main";
      sha256 = "sha256-5aR1b/4/NhJlnXtz4Un0kDzatl7BHLHRDCavj6QjKVk=";
    };
	configurationLimit = 5;
  };
}
