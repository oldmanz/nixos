#!/usr/bin/env bash

nix --experimental-features "nix-command flakes" \
run github:nix-community/disko -- \
--mode disko ./hosts/$1/disko.nix

mkdir -p /mnt/etc/nixos
cp -r ./* /mnt/etc/nixos/


mkdir /mnt/persist/system
mkdir -p /mnt/persist/home/oldmanz

nixos-install --root /mnt --flake /mnt/etc/nixos#$1
