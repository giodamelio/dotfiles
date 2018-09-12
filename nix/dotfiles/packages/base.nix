{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    curl
    stow
    git
    sudo
    tree
    avahi
    exfat
  ];
}
