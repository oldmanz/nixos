{ config, pkgs, ... }:
{
imports = [
  ./impermanence.nix
  ./git.nix
  ./zsh.nix
  ./gnome
  ./hyprland.nix

];
}
