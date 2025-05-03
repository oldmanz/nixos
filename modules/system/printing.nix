{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.system.printing.enable = 
        lib.mkEnableOption "enables printing";
    };

    config = lib.mkIf config.z.system.printing.enable {

        services.printing.enable = true;
    };
}
