{ config, pkgs, ... }:
{
imports = [
  ./nvidiaGraphics.nix
  ./amdGraphics.nix
  ./intelGraphics.nix
  ./hardwareGraphics.nix
];
}