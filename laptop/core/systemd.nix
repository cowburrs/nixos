
{ pkgs, ... }:
{
  systemd.services.plymouth-quit = {
    serviceConfig.ExecStartPre = [
      "/run/current-system/sw/bin/sleep 5"
    ];
  };
}
