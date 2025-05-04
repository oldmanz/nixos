{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.system.display.sddm.enable = 
        lib.mkEnableOption "enables sddm";
    };

    config = lib.mkIf config.z.system.display.sddm.enable {
      services.xserver.enable = true;
      services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
}
