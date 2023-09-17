#!/bin/sh
pushd ~/.dotfilesMaggie
home-manager switch -f ./users/pep/home.nix
popd
