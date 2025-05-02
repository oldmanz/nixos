{ config, pkgs, ... }:
{
imports = [
  ./drivers
  ./software
  ./system
];
}