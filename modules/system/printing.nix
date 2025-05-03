{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.printing.enable = 
        lib.mkEnableOption "enables printing";
    };

    config = lib.mkIf config.z.printing.enable {

        services.printing.enable = true;
    };
}
