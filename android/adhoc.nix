{ pkgs ? import <nixpkgs> { } }:

with pkgs;

let
  android-nixpkgs = callPackage (import (builtins.fetchGit {
    url = "https://github.com/tadfisher/android-nixpkgs.git";
  })) {
    # Default; can also choose "beta", "preview", or "canary".
    channel = "stable";
  };

in
android-nixpkgs.sdk (sdkPkgs: with sdkPkgs; [
  cmdline-tools-latest
  build-tools-31-0-0
  platform-tools
  platforms-android-31
  emulator
])