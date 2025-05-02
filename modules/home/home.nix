{ pkgs, inputs, ... }:

{ 
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
      # ...
      gnomeExtensions.paperwm
      gnomeExtensions.vitals
      gnomeExtensions.space-bar
    ];
    dconf.settings = import ./dconf.nix;

  # home.persistence."/persist/home/oldmanz" = {
  #   directories = [
  #     "nixos"
  #     "Downloads"
  #     "Music"
  #     "Pictures"
  #     "Documents"
  #     "Videos"
  #     "VirtualBox VMs"
  #     ".gnupg"
  #     ".ssh"
  #     ".nixops"
  #     ".local/share/keyrings"
  #     ".local/share/direnv"
  #     ".vscode"
  #     {
  #       directory = ".local/share/Steam";
  #       method = "symlink";
  #     }
  #   ];
  #   files = [
  #     ".screenrc"
  #     ".bash_history"
  #   ];
  #   allowOther = true;
  # };

  programs = {
      git = {
        enable = true;
	      userName  = "oldmanz";
	      userEmail = "travis@oldmanz.com";
	      extraConfig = {
	        user = {
            signingkey = "78FA7117E5E1A5D6980C18FB0E46772539892CBC";
	        };
          #commit = {
          #  gpgsign = true;
          #};
	      };
	    };
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
          e = "exit";
        };
        oh-my-zsh = {
          enable = true;
          plugins = [ "git" "systemd" "rsync" "kubectl" ];
          theme = "lambda";
        };
      };
      };
}
