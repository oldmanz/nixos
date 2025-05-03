{ config, pkgs, ... }:
{
imports = [
  ./nixConfig.nix
  ./systemImpermanence.nix
  ./sound.nix
  ./virtualisation.nix
  ./boot.nix
  ./networking.nix
  ./localization.nix
  ./bluetooth.nix
  ./ssh.nix
  ./printing.nix
  ./shell.nix
  ./users.nix
  ./display
];
}
