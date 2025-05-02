{ pkgs, lib, config, inputs, ... }: {

    options = {
        z.networking.enable = 
            lib.mkEnableOption "enables networking";
    };

    config = lib.mkIf config.z.networking.enable {

        networking = {
            networkmanager.enable = true;
            firewall.enable = false;
        };
    };
}