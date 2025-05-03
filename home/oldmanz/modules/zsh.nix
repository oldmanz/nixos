{ pkgs, lib, config, inputs, ... }: {

    options = {
    z.home.zsh.enable = 
        lib.mkEnableOption "enables zsh";
    };

    config = lib.mkIf config.z.home.zsh.enable {

  programs = {
      zsh = {
        enable = true;
        enableCompletion = false; # enabled in oh-my-zsh
        initContent = ''
          test -f ~/.dir_colors && eval $(dircolors ~/.dir_colors)
        '';
        shellAliases = {
          sudo="sudo ";
          v = "nvim";
          vi = "nvim";
          vim = "nvim";
          h = "nixos-rebuild switch --flake $HOME/nixos#$HOST";
          s = "nixos-rebuild switch --flake $HOME/nixos#$HOST";
          os = "code ~/nixos/system/configuration.nix";
          oh = "code ~/nixos/home/home.nix";
          w = "curl wttr.in";
	  t = "echo test";
          e = "exit";
        };
        oh-my-zsh = {
          enable = true;
          plugins = [ "git" "systemd" "rsync" "kubectl" ];
          theme = "lambda";
        };
      };
      };
    };
}
