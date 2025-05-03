{ pkgs, lib, config, inputs, ... }: {

    options = {
        z.system.boot.enable = 
            lib.mkEnableOption "enables boot";
    };

    config = lib.mkIf config.z.system.boot.enable {

          boot = {
            loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
            timeout = 1;
            };
        };
    };
}