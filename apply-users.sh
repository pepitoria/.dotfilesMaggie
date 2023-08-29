#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/pep/home.nix
popd
