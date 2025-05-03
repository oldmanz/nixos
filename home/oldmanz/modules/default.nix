{ config, pkgs, ... }:
{
imports = [
  ./homeImpermanence.nix
  ./git.nix
  ./zsh.nix
  ./gnome
];
}
