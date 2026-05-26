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
    settings = {
      user.name = "burrs";
      user.email = "dwadwa@dwa.com";
      merge.tool = "nvimdiff";
    };
  };

  # home.file.".local/share/Anki2/addons21" = {
  #   source = ./resources/addons21;
  # };

  # warnings = [ (builtins.getEnv "FLAKE_DIR") ]; # yeah its not possible let me kill myself
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
      localDir = "${flakeDir}/resources/.local/share";
      localApps = builtins.attrNames (builtins.readDir localDir);
    in
    builtins.listToAttrs (
      map (app: {
        name = ".config/${app}";
        value.source = config.lib.file.mkOutOfStoreSymlink "${configDir}/${app}";
        value.force = true;
      }) apps
    )
    // builtins.listToAttrs (
      map (app: {
        name = ".local/share/${app}";
        value.source = config.lib.file.mkOutOfStoreSymlink "${localDir}/${app}";
        value.force = true;
      }) localApps
    )
    // {
      ".local/share/Anki2/addons21" = {
        source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/resources/misc/Anki2/addons21";
        force = true;
      };

      ".local/share/Steam/steamapps/compatdata/2225070/pfx/drive_c/users/steamuser/OpenplanetNext" = {
        source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/resources/misc/OpenplanetNext";
        force = true;
      };

      ".local/share/Steam/steamapps/common/Counter-Strike Global Offensive/game/csgo/cfg/autoexec.cfg" = {
        source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/resources/misc/autoexec.cfg";
        force = true;
      };

      ".logseq" = {
        force = true;
        source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/resources/.logseq";
      };

      ".bash_profile" = {
        force = true;
        source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/resources/.bash_profile";
      };

      ".bashrc" = {
        force = true;
        source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/resources/.bashrc";
      };
    };

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
