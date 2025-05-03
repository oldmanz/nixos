{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.home.hyprland.enable = 
        lib.mkEnableOption "enables hyprland";
    };

    config = lib.mkIf config.z.home.hyprland.enable {

            wayland.windowManager.hyprland = {
                enable = true;
                # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
                package = null;
                portalPackage = null;
                settings = {
                        "$mod" = "SUPER";
                        bind =
                        [
                            "$mod, F, exec, firefox"
                            ", Print, exec, grimblast copy area"
                            "$mod, ENTER, exec, kitty"
                        ]
                        ++ (
                            # workspaces
                            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
                            builtins.concatLists (builtins.genList (i:
                                let ws = i + 1;
                                in [
                                "$mod, code:1${toString i}, workspace, ${toString ws}"
                                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                                ]
                            )
                            9)
                        );
                };
            };
            programs.kitty.enable = true;
    };
}

