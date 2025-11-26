{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

		home-manager = {
			url = "github:nix-community/home-manager/release-23.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		yazi.url = "github:sxyazi/yazi";
	};

	outputs = { nixpkgs, home-manager, yazi, ... }: {
		# To install Yazi system-wide:
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {
				modules = [
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

		# To install it for a specific user:
		homeConfigurations = {
			"alice@nixos" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux;
				modules = [
					({ pkgs, ... }: {
						home.packages = [
							(yazi.packages.${pkgs.system}.default.override {
								_7zz = pkgs._7zz-rar;  # Support for RAR extraction
							})
						];
					})
				];
			};
		};
	};
}
