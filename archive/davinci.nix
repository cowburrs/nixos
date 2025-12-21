{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    davinci-resolve
  ];
  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libva-vdpau-driver
      libvdpau-va-gl # also not sure if this is needed
      rocmPackages.clr.icd
	  mesa.opencl
    ];
  };
  hardware.amdgpu.opencl.enable = true;

}
