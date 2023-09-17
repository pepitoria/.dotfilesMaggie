#!/bin/sh
pushd ~/.dotfilesMaggie
sudo nixos-rebuild switch -I nixos-config=./system/configuration.nix
popd
