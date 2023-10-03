{ config, pkgs, ... }:

let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
  
  android-nixpkgs = pkgs.callPackage <android-nixpkgs> {
    # Default; can also choose "beta", "preview", or "canary".
    channel = "stable";
  };

in {
  users.users.pep.packages = with pkgs; [
    unstable.distrobox
  ];

}