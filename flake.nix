{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    yazi.url = "github:sxyazi/yazi";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
        # to have it up-to-date or simply don't specify the nixpkgs input
        nixpkgs.follows = "nixpkgs";
        # home-manager.follows = "home-manager";
      };
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    {

      # Please replace my-nixos with your hostname
      nixosConfigurations.burrs = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          inputs.spicetify-nix.nixosModules.default
          ./burrs.nix
        ];
      };
    };
}
