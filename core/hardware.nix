{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Necessary for backlight
  hardware.i2c.enable = true;

	# Necessary for AMD> but why not
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
