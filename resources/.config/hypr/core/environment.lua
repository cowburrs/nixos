-- See https://wiki.hyprland.org/Configuring/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")


-- exec = gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
-- exec = gsettings org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.env("QT_QPA_PLATFORM", "wayland")
-- env = ELECTRON_OZONE_PLATFORM_HINT,auto
