{
  config,
  lib,
  pkgs,
  ...
}:
{
  systemd.settings = {
    Manager = {
      DefaultTimeoutStopSec = "10s";
    };
  };
}
