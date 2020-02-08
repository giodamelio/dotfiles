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
    kitty
    gnupg
    emacs
    nnn
    zip
    unzip
    exfat
    xdg_utils
    syncthing
    zsh
  ];
}
