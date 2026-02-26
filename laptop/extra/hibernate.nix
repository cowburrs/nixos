{ ... }:
{
  # Suspend first
  boot.kernelParams = [
    "resume_offset=2240512"
    "mem_sleep_default=deep"
  ];

  boot.resumeDevice = "/dev/disk/by-uuid/0ca5a399-172e-436f-931d-5392b08b231e";

  powerManagement.enable = true;

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 32 * 1024; # 32GB
    }
  ];

  # services.power-profiles-daemon.enable = true;
  # Suspend first then hibernate when closing the lid
  # Hibernate on power button pressed
	# services.logind.settings.Login.LidSwitch = "suspend-then-hibernate";
	# services.logind.settings.Login.PowerKey = "hibernate";
	#  services.logind.settings.Login.PowerKeyLongPress = "poweroff";
	services.logind.lidSwitch = "suspend-then-hibernate";
	services.logind.powerKey = "hibernate";
	services.logind.powerKeyLongPress = "poweroff";

  # Define time delay for hibernation
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=10m
    SuspendState=mem
  '';
}
