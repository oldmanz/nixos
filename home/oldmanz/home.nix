{ pkgs, inputs, ... }:

{ 
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./modules
  ];
  
  z.home.impermanence.enable = mkIf (z.system.impermanence.enable == true) true;false;
  z.home.git.enable = true;
  z.home.zsh.enable = true;
  z.home.gnome.enable = true;
  z.home.hyprland.enable = false;

  home.stateVersion = "24.05";

}
