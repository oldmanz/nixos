{ pkgs, inputs, ... }:

{ 
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./modules
  ];
  
  z.homeImpermanence.enable = false;
  z.git.enable = true;
  z.zsh.enable = true;
  z.gnome.enable = true;

  home.stateVersion = "24.05";

}
