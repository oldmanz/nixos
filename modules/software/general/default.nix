{ pkgs, lib, config, inputs, ... }: {
    options = {
    z.software.general.enable = 
        lib.mkEnableOption "enables general";
    };

    config = lib.mkIf config.z.software.general.enable {
        environment.systemPackages = with pkgs; [
            neovim
            wget
            git
            google-chrome
        ];
    };
}
