{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Systemd(Crazy that you can switch)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
