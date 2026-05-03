{
  config,
  pkgs,
  self,
  lib,
  ...
}:

let
  flakeDir =

    let
      env = builtins.getEnv "FLAKE_DIR";
    in
    if env != "" then env else self.outPath;
in
{
  # TODO please change the username & home directory to your own
  home.username = "burrs";
  home.homeDirectory = "/home/burrs";

  programs.git = {
    enable = true;
    package = pkgs.emptyDirectory;
    userName = "burrs";
    userEmail = "dwadwa@dwa.com";
  };

  # home.file.".local/share/Anki2/addons21" = {
  #   source = ./resources/addons21;
  # };

  warnings = [ (builtins.getEnv "FLAKE_DIR") ]; # yeah its not possible let me kill myself
  # home.file.".local/share/Anki2/addons21".source =
  #   config.lib.file.mkOutOfStoreSymlink "${flakeDir}/resources/addons21";
  # home.file.".config/btop" =
  # let
  #   rndm = builtins.trace "filelocation: ${lib.filesystem.listFilesRecursive "${flakeDir}/resources/.config/btop"}" true;
  # in
  # {
  #   force = rndm;
  #   source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/resources/.config/btop";
  # };
  home.file =
    let
      configDir = "${flakeDir}/resources/.config";
      apps = builtins.attrNames (builtins.readDir configDir);
    in
    builtins.listToAttrs (
      map (app: {
        name = ".config/${app}";
        value.source = config.lib.file.mkOutOfStoreSymlink "${configDir}/${app}";
		  value.force = true;
      }) apps
    )
    // {
      ".local/share/Anki2/addons21".source =
        config.lib.file.mkOutOfStoreSymlink "${flakeDir}/resources/addons21";
    };
  # home.file.".config" = {
  #   force = true;
  # recursive = true;
  #   source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/resources/.config/";
  # };

  # builtins.trace "filelocation: ${flakeDir}" ( # NOTE: useful function
  # );

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
