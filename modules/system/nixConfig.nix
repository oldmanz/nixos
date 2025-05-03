{ pkgs, lib, config, inputs, ... }: {

  options = {
    z.system.nixConfig.enable = 
      lib.mkEnableOption "enables nixConfig";
  };

  config = lib.mkIf config.z.system.nixConfig.enable {

  system.stateVersion = "24.11";
    nix = {
        # Automate garbage collection
        gc = {
          automatic = true;
          dates     = "weekly";
          options   = "--delete-older-than 7d";
        };

        # Avoid unwanted garbage collection when using nix-direnv
        extraOptions = ''
          experimental-features = nix-command flakes
          keep-outputs          = true
          keep-derivations      = true
        '';

        settings = {
          # Automate `nix store --optimise`
          auto-optimise-store = true;

          # Required by Cachix to be used as non-root user
          trusted-users = [ "root" ];
        };
      };

      nixpkgs = {
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (pkg: true);
        };
      };
  };
}
