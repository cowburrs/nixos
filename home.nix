{
  config,
  pkgs,
  self,
  lib,
  ...
}:

{
  # TODO please change the username & home directory to your own
  home.username = "burrs";
  home.homeDirectory = "/home/burrs";

  # Import files from the current configuration directory into the Nix store,
  # and create symbolic links pointing to those store files in the Home directory.

  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # Import the scripts directory into the Nix store,
  # and recursively generate symbolic links in the Home directory pointing to the files in the store.
  # home.file."./." = {
  #   source = ./home/burrs;
  #   recursive = true; # link recursively
  # };

  # the home manager dream is dead.
  # home.file.".config/nvim".source =
  #   let
  #     filelocation = builtins.getEnv "PWD";
  #   in
  #   config.lib.file.mkOutOfStoreSymlink "${filelocation}/home/burrs/.config/nvim";

  # home.file.".config/nvim".source =
  #   let
  #     filelocation = builtins.getEnv "PWD";
  #   in
  #   builtins.trace "filelocation: ${filelocation}" (
  #     config.lib.file.mkOutOfStoreSymlink "${filelocation}/home/burrs/.config/nvim"
  #   );

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    package = pkgs.emptyDirectory;
    userName = "burrs";
    userEmail = "dwadwa@dwa.com";
  };

  # home.activation =
  #   let
  #     filelocation = builtins.getEnv "PWD";
  #   in
  #   {
  #     linkNvim = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #       ln -sf ${filelocation}/nvim ${HOME_DIR}/.config/nvim
  #     '';
  #   };

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
