{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    starship # easy shell
    neofetch # show system info on shell init
  ];

  programs.fish = {
    enable = true;

    # Setup sharship shell
    interactiveShellInit = ''
      starship init fish | source
    '';

    # Remove greeting
    functions = {
      fish_greeting = "neofetch";
    };
  };
}
