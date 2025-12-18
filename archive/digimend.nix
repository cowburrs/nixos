{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.xserver.digimend.enable = true;

  environment.systemPackages = [
    config.boot.kernelPackages.digimend
  ];
}
