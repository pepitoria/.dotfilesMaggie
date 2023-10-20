#!/bin/sh
pushd ~/.dotfilesMaggie
sudo cp ./system/*.nix /etc/nixos/
sudo nixos-rebuild switch -I nixos-config=./system/configuration.nix
popd
