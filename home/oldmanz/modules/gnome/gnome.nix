{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.gnome.enable = 
        lib.mkEnableOption "enables gnome";
    };

    config = lib.mkIf config.z.gnome.enable {

  home.packages = with pkgs; [
      # ...
      gnomeExtensions.paperwm
      gnomeExtensions.vitals
      gnomeExtensions.space-bar
    ];
    dconf.settings = import ./dconf.nix;
    };
}
