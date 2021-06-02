{ config, pkgs, ... }:

{
  # Setup some overlays
  nixpkgs.overlays = [
    # Build Neovim from source
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  home.packages = with pkgs; [
    neovim-nightly
  ];

  programs.fish = {
    shellAliases = {
      vim = "nvim";
    };
  };
}
