{ config, pkgs, ... }:

let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
    
in {
  users.users.pep.packages = with pkgs; [
    # IDE
      unstable.jetbrains.idea-community
  ];

}