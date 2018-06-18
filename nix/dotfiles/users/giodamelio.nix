{ lib, ... }:

with lib; {
  users.users.giodamelio = {
    isNormalUser = true;
    description = "Gio d'Amelio";
    home = "/home/giodamelio";
    shell = "/run/current-system/sw/bin/fish";
    extraGroups = ["wheel"];
  };
}
