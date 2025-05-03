{ config, pkgs, ... }:
{
imports = [
  ./nvidia.nix
  ./amd.nix
  ./intel.nix
  ./hardware.nix
];
}