{ config, pkgs, ... }:
{
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
        xdg-desktop-portal-termfilechooser
      ];
    };
  };
  xdg.portal.config.common."org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
}
