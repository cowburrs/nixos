{
  description = "Burrs flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    catppuccin = {
      # TODO: Change this as well when changing nixurl
      url = "github:catppuccin/nix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    musnix.url = "github:musnix/musnix";
    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.hyprlang.follows = "hyprland/hyprlang";
    };
    mikuboot = {
      url = "github:cowburrs/mikuboot";
      inputs.nixpkgs.follows = ""; # only useful for the package output
    };
    # millennium.url = "github:SteamClientHomebrew/Millennium/01a7f1f9?dir=packages/nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    exo2 = {
      url = "github:googlefonts/Exo-2.0";
      flake = false;
    };
    syne = {
      url = "git+https://gitlab.com/bonjour-monde/fonderie/syne-typeface.git";
      flake = false;
    };
    bookmarks = {
      url = "github:cowburrs/bookmarks";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      ...
    }@inputs:
    {

      packages."x86_64-linux" = {
        exo2 = nixpkgs.legacyPackages.x86_64-linux.callPackage ./packages/exo2.nix {
          src = inputs.exo2;
        };
        syne = nixpkgs.legacyPackages.x86_64-linux.callPackage ./packages/syne.nix {
          src = inputs.syne;
        };
      };
      nixosConfigurations =
        let
          system = "x86_64-linux";

          # Shared modules
          sharedModules = [
            inputs.catppuccin.nixosModules.catppuccin
            inputs.musnix.nixosModules.musnix
            inputs.spicetify-nix.nixosModules.default
            inputs.mikuboot.nixosModules.default
            inputs.home-manager.nixosModules.home-manager
            inputs.nix-flatpak.nixosModules.nix-flatpak
            {
              home-manager.extraSpecialArgs = { inherit self; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.burrs = ./home.nix;
            }
          ];

          # Shared specialArgs
          sharedArgs = {
            inherit inputs;
            inherit nixpkgs-unstable;
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
              # config.allowBroken = true;
              config.permittedInsecurePackages = [ "electron-39.8.10" ];
            };
          };
        in
        {
          burrs = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = sharedModules ++ [
              ./burrs.nix
            ];
            specialArgs = sharedArgs;
          };

          laptop = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = sharedModules ++ [
              ./laptop.nix
            ];
            specialArgs = sharedArgs;
          };
        };
      # # nh doesnt build without this idk why
      # easter egg of a simpler time in my life
      # no you dont need it for a rebuild idk why i wrote this down
      # haha its kinda silly funny icl
      # packages.x86_64-linux = {
      #   burrs = self.nixosConfigurations.burrs;
      #   laptop = self.nixosConfigurations.laptop;
      # };
    };

}
