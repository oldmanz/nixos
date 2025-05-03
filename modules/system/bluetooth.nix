{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.system.bluetooth.enable = 
        lib.mkEnableOption "enables bluetooth";
    };

    config = lib.mkIf config.z.system.bluetooth.enable {

        services.blueman.enable = true;
    };
}
