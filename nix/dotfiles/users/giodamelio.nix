{ lib, pkgs, ... }:

with lib; {
  users.users.giodamelio = {
    isNormalUser = true;
    description = "Gio d'Amelio";
    home = "/home/giodamelio";
    shell = pkgs.bash;
    extraGroups = ["wheel" "docker"];
  };
}
