{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    exa # ls
    bat # cat
    ripgrep # grep
    fd # find
    procs # ps
    sd # sed
    dust # du
    zoxide # cd
    delta # diff
    dogdns # dig
  ];

  programs.fish = {
    # Create some aliases for programs that are more or less drop in replacements
    shellAliases = {
      ls = "exa";
      ll = "exa -l";
      la = "exa -la";

      cat = "bat";

      grep = "rg";

      diff = "delta";

      dig = "dog";
    };

    # Setup Zoxide in the shell
    interactiveShellInit = ''
      zoxide init fish | source
    '';
  };
}
