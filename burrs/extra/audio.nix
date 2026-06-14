{ pkgs, ... }: {
  # services.pipewire.extraConfig.pipewire."99-nixaudio" = {
  #   "context.modules" = [
  #     {
  #       name = "libpipewire-module-loopback";
  #       args = {
  #         "capture.props" = {
  #           "node.name" = "soundboard_in";
  #           "node.description" = "Soundboard";
  #           "media.class" = "Audio/Sink";
  #           "audio.position" = "FL,FR";
  #           "node.dont-fallback" = true;
  #         };
  #         "playback.props" = {
  #           "node.name" = "soundboard_out";
  #           "node.description" = "Soundboard Mic";
  #           "media.class" = "Audio/Source";
  #           "audio.position" = "FL,FR";
  #           "priority.driver" = 8000;
  #           "priority.session" = 8000;
  #           "node.dont-fallback" = true;
  #         };
  #       };
  #     }
  #   ];
  # };
  # environment.systemPackages = [
  #   (pkgs.writeShellApplication {
  #     name = "sbplay";
  #     text = ''
  #       exec ${pkgs.mpv}/bin/mpv --audio-device=pipewire/soundboard_in --no-video "$@"
  #     '';
  #   })
  # ];

}
