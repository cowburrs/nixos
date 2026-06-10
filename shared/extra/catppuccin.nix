{
  ...
}:
{
  nixpkgs.config.packageOverrides = pkgs: {
    whiskers = pkgs.whiskers.overrideAttrs (old: {
      env.CARGO_PROFILE_RELEASE_LTO = "false";
      env.CARGO_PROFILE_RELEASE_OPT_LEVEL = "1";
      env.CARGO_BUILD_JOBS = 2;
    });
  };
  catppuccin.enable = true;
  catppuccin.flavor = "macchiato";
  # catppuccin.fcitx5.enable = true;
  catppuccin.fcitx5.enableRounded = true;
  catppuccin.plymouth.enable = false;
  catppuccin.grub.enable = false;
}
