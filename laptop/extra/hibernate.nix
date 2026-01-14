{ ... }:
{
  # Suspend first
  boot.kernelParams = [
    "resume_offset=208748544"
    "mem_sleep_default=deep"
  ];

  boot.resumeDevice = "/dev/disk/by-uuid/f1945c61-ae98-48fe-afa2-2114265bb857";

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
