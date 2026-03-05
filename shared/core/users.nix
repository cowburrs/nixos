{
  config,
  lib,
  pkgs,
  ...
}:
{

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.burrs = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "i2c"
      "video"
			"audio" # musnix
			"networkmanager"
			"plugdev"
			"dialout"
    ]; # Enable ‘sudo’ for the user.
  };

  users.users.guest = {
    isNormalUser = true;
    password = null;
		extraGroups = [];
  };

}
