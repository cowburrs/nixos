{ pkgs, ... }:
{
  services.udev.packages = [ pkgs.libmtp ];
  services.gvfs.enable = true;
  environment.systemPackages = [
    pkgs.simple-mtpfs
    pkgs.go-mtpfs
  ];
}
