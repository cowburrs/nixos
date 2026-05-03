{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    wezterm-types = {
      url = "github:DrKJeff16/wezterm-types";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, wezterm-types, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        shellHook = ''
          export LUA_LIBS="${wezterm-types}"
          export PS1="\n\[\033[1;32m\][nix-shell:\w]\$\[\033[0m\] "
        '';
      };
    };
}
