{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Necessary for backlight
  hardware.i2c.enable = true;

}
