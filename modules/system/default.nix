{ config, pkgs, ... }:
{
imports = [
  ./nixConfig.nix
  ./systemImpermanence.nix
  ./sound.nix
  ./virtualisation.nix
  ./boot.nix
];
}