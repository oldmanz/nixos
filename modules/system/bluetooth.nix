{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.bluetooth.enable = 
        lib.mkEnableOption "enables bluetooth";
    };

    config = lib.mkIf config.z.bluetooth.enable {

        services.blueman.enable = true;
    };
}
