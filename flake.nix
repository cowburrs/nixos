{
  description = "Burrs flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    catppuccin.url = "github:catppuccin/nix";
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
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      ...
    }@inputs:
    {
      nixosConfigurations =
        let
          system = "x86_64-linux";

          # Shared modules
          sharedModules = [
            inputs.catppuccin.nixosModules.catppuccin
            inputs.musnix.nixosModules.musnix
            inputs.spicetify-nix.nixosModules.default
            inputs.mikuboot.nixosModules.default
          ];

          # Shared specialArgs
          sharedArgs = {
            inherit inputs;
            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
              # config.allowBroken = true;
            };
          };
        in
        {
          burrs = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = sharedModules ++ [ ./burrs.nix ];
            specialArgs = sharedArgs;
          };

          laptop = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = sharedModules ++ [ ./laptop.nix ];
            specialArgs = sharedArgs;
          };
        };
			# nh doesnt build without this idk why
      packages.x86_64-linux = {
        burrs = self.nixosConfigurations.burrs;
        laptop = self.nixosConfigurations.laptop;
      };
    };

}
