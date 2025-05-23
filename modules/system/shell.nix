{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.system.shell.enable = 
        lib.mkEnableOption "enables shell";
    };

    config = lib.mkIf config.z.system.shell.enable {

      environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

    };
}
