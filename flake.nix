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
      self,
      nixpkgs,
      yazi,
      zen-browser,
      spicetify-nix,
      ...
    }@inputs:
    {

      # Please replace my-nixos with your hostname
      nixosConfigurations.burrs = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        # imports = [
        #   # For NixOS
        # ];
        modules = [
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./configuration.nix

          inputs.spicetify-nix.nixosModules.default

          (
            { pkgs, ... }:
            {
              environment.systemPackages = [
                (yazi.packages.${pkgs.system}.default.override {
                  _7zz = pkgs._7zz-rar; # Support for RAR extraction
                })
                zen-browser.packages.${pkgs.system}.default
              ];

              programs.spicetify =
                let
                  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
                in
                {
                  enable = true;

                  enabledExtensions = with spicePkgs.extensions; [
                    adblock
                    hidePodcasts
                    keyboardShortcut
                    fullAppDisplay
                    volumePercentage
                    copyLyrics
                    shuffle # shuffle+ (special characters are sanitized out of extension names)
                  ];
                  enabledCustomApps = with spicePkgs.apps; [
                    newReleases
                    ncsVisualizer
                    marketplace
                  ];
                  enabledSnippets = with spicePkgs.snippets; [
                    rotatingCoverart
                    pointer
                  ];

                  theme = spicePkgs.themes.comfy;
                  # theme = spicePkgs.themes.catppuccin;
                  # colorScheme = "macchiato";
                };

            }
          )
        ];
      };
    };
}
