{ config, lib, pkgs, inputs, outputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/software/default.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  z.system.boot.enable = true;
  z.system.impermanence.enable = false;
  z.system.nixConfig.enable = true;
  z.system.sound.enable = true;
  z.system.virtualisation.enable = true;
  z.system.networking.enable = true;
  z.system.localization.enable = true;
  z.system.bluetooth.enable = true;
  z.system.ssh.enable = true;
  z.system.printing.enable = true;
  z.system.shell.enable = true;
  
  z.drivers.graphics.amd.enable = true;

  z.system.display.gnome.enable = true;
  z.system.display.kde.enable = false;
  z.system.display.hyprland.enable = false;

  z.system.users.enable = true;

  z.software.general.enable = true;
  z.software.gaming.enable = true;
  z.software.coding.enable = true;


}
