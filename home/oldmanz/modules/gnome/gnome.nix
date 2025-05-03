{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.home.gnome.enable = 
        lib.mkEnableOption "enables gnome";
    };

    config = lib.mkIf config.z.home.gnome.enable {

  home.packages = with pkgs; [
      # ...
      gnomeExtensions.paperwm
      gnomeExtensions.vitals
      gnomeExtensions.space-bar
    ];
    dconf.settings = import ./dconf.nix;
    };
}
