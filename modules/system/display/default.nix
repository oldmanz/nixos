
{ config, pkgs, ... }:
{
imports = [
  ./gnome.nix
  ./hyprland.nix
  ./sddm.nix
];
}
