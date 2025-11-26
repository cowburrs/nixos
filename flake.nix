{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		yazi.url = "github:sxyazi/yazi";
  };

  outputs = { self, nixpkgs, yazi, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.cow = nixpkgs.lib.nixosSystem {
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
		({ pkgs, ... }: {
			environment.systemPackages = [
				(yazi.packages.${pkgs.system}.default.override {
					_7zz = pkgs._7zz-rar;  # Support for RAR extraction
				})
			];
		})
      ];
    };
  };
}
