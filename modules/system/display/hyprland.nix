{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.system.display.hyprland.enable = 
        lib.mkEnableOption "enables hyprland";
    };

    config = lib.mkIf config.z.system.display.hyprland.enable {
      programs.hyprland.enable = true;
      environment.sessionVariables.NIXOS_OZONE_WL = "1";
    };
}
