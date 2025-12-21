{ ... }:
{
  boot.kernelParams = [ "resume_offset=<first_physical_offset>" ];

  boot.resumeDevice = "/dev/disk/by-uuid/199eb254-1563-4b3b-9456-3338bffce29f";

  powerManagement.enable = true;

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 32 * 1024; # 32GB in MB
    }
  ];
}
