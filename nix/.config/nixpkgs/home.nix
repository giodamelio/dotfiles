{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "giodamelio";
  home.homeDirectory = "/home/giodamelio";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  nixpkgs.config.allowUnfree = true;

  # Install some general programs
  home.packages = with pkgs; [
    htop
    git
    firefox-devedition-bin
    stow
    tree
    gcc
    nerdfonts
    fzf

    xsv # csv utility
    bandwhich # current network connection monitor
    grex # build regex based on inputs
  ];

  imports = [
    ./program/nvim.nix
    ./program/alacritty.nix

    ./role/coreutils-replacements.nix
    ./role/shell-fish.nix
  ];
}
