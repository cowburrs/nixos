{
  config,
  lib,
  pkgs,
  ...
}:
{
  system.activationScripts.reaperPlugins = {
    text = ''
      USER_PLUGINS="/home/burrs/.config/REAPER/UserPlugins"
      USER_SCRIPTS="/home/burrs/.config/REAPER/Scripts"
      mkdir -p "$USER_PLUGINS"
      mkdir -p "$USER_SCRIPTS"
      ln -sfn "${pkgs.reaper-sws-extension}/UserPlugins/reaper_sws-x86_64.so" "$USER_PLUGINS/reaper_sws-x86_64.so"
      ln -sfn "${pkgs.reaper-reapack-extension}/UserPlugins/reaper_reapack-x86_64.so" "$USER_PLUGINS/reaper_reapack-x86_64.so"
      if [ -f "${pkgs.reaper-sws-extension}/Scripts/sws_python.py" ]; then
        ln -sfn "${pkgs.reaper-sws-extension}/Scripts/sws_python.py" "$USER_SCRIPTS/sws_python.py"
      fi
      if [ -f "${pkgs.reaper-sws-extension}/Scripts/sws_python64.py" ]; then
        ln -sfn "${pkgs.reaper-sws-extension}/Scripts/sws_python64.py" "$USER_SCRIPTS/sws_python64.py"
      fi
      chown -R burrs:users "$USER_PLUGINS"
    '';

  };
}
