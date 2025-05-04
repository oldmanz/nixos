{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.system.display.hyprland.enable = 
        lib.mkEnableOption "enables hyprland";
    };

    config = lib.mkIf config.z.system.display.hyprland.enable {
      programs.hyprland.enable = true;
      programs.hyprland.withUWSM = true;
      services.xserver.enable = true;
      programs.hyprland.xwayland.enable = true;  
      environment.sessionVariables.NIXOS_OZONE_WL = "1";
      z.system.display.sddm.enable = true;
      xdg.portal = {
      	enable = true;
	extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      };
    };
}
