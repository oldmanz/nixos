{ pkgs, lib, config, inputs, ... }: {
    imports = [
        ./steam.nix
    ];
    options = {
    z.software.gaming.enable = 
        lib.mkEnableOption "enables gaming";
    };

    config = lib.mkIf config.z.software.gaming.enable {
        z.steam.enable = true;

    };
}
