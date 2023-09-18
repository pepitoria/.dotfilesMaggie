{ config, pkgs, ... }:

let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
  
  android-nixpkgs = pkgs.callPackage <android-nixpkgs> {
    # Default; can also choose "beta", "preview", or "canary".
    channel = "stable";
  };

android-sdk = android-nixpkgs.sdk (sdkPkgs: with sdkPkgs; [
    cmdline-tools-latest
    build-tools-32-0-0
    platform-tools
    platforms-android-31
    emulator
  ]);

in {
  users.users.pep.packages = with pkgs; [
    # IDE
    android-tools
    android-sdk
    unstable.android-studio
  ];

  #environment.variables = {
  #  ANDROID_SDK_ROOT = "${android-sdk}/share/android-sdk";
  #  ANDROID_HOME = "$ANDROID_SDK_ROOT";
  #};
  environment.variables = let home= "${android-sdk}/share/android-sdk"; in {
    ANDROID_SDK_ROOT = home;
    ANDROID_HOME = home;
  };
}