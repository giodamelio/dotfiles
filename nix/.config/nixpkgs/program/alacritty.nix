{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      shell.program = "fish";

      font = {
        size = 16.0;

        normal = {
	  family = "InconsolataGo Nerd Font";
	};
      };
    };
  };
}
