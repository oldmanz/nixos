{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.system.display.kde.enable = 
        lib.mkEnableOption "enables kde";
    };

    config = lib.mkIf config.z.system.display.kde.enable {
      services.xserver.enable = true;
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;
      environment.systemPackages = [
        pkgs.kdePackages.yakuake
      ];
    };
}
