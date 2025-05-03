{ pkgs, lib, config, inputs, ... }: {

    options = {
        z.system.networking.enable = 
            lib.mkEnableOption "enables networking";
    };

    config = lib.mkIf config.z.system.networking.enable {

        networking = {
            networkmanager.enable = true;
            firewall.enable = false;
        };
    };
}