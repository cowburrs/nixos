{ config, pkgs, ... }:

{
  # For obs?
  security.polkit.enable = true;

  # rtkit (optional, recommended) allows Pipewire to use the realtime scheduler for increased performance.
  security.rtkit.enable = true;
}
