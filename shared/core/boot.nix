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
      owner = "shvchk";
      repo = "fallout-grub-theme";
      rev = "80734103d0b48d724f0928e8082b6755bd3b2078";
      sha256 = "sha256-7kvLfD6Nz4cEMrmCA9yq4enyqVyqiTkVZV5y4RyUatU=";
    };
  };

}
