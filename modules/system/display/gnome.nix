{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.gnome.enable = 
        lib.mkEnableOption "enables gnome";
    };

    config = lib.mkIf config.z.gnome.enable {
  services = {
     xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome = {
        enable = true;
        extraGSettingsOverridePackages = [ pkgs.mutter ];
        extraGSettingsOverrides = ''
          [org.gnome.mutter]
          experimental-features=['scale-monitor-framebuffer']
        '';
      };

      ## X11 Keymap
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
    };
}
