{ config, lib, pkgs, inputs, outputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/software/default.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  z.boot.enable = true;
  z.systemImpermanence.enable = false;
  z.nixConfig.enable = true;
  z.sound.enable = true;
  z.virtualisation.enable = true;
  z.networking.enable = true;
  z.localization.enable = true;
  z.bluetooth.enable = true;
  z.ssh.enable = true;
  z.printing.enable = true;
  z.shell.enable = true;
  
  z.amdGraphics.enable = true;
  z.gnome.enable = true;
  z.users.enable = true;

  z.software.general.enable = true;
  z.software.gaming.enable = true;
  z.software.coding.enable = true;


}
