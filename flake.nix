{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
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
  };

  outputs = { self, nixpkgs, yazi, zen-browser, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.burrs = nixpkgs.lib.nixosSystem {
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        ({ pkgs, ... }: {
          environment.systemPackages = [
            (yazi.packages.${pkgs.system}.default.override {
              _7zz = pkgs._7zz-rar; # Support for RAR extraction
            })
            zen-browser.packages.${pkgs.system}.default
          ];
        })
      ];
    };
  };
}
