#!/bin/bash

sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
sudo nix-channel --add https://nixos.org/channels/nixos-24.11 nixos
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
