{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  # Allow funky licenses
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (final: prev: {
      nh = prev.nh.overrideAttrs (old: {
        postPatch = (old.postPatch or "") + ''
          substituteInPlace src/search.rs --replace-fail 'latest-44-' 'latest-46-'
        '';
      });
    })
  ];
}
