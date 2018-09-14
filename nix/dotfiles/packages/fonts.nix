{ pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    inconsolata
    google-fonts
    font-awesome_4
    iosevka
  ];
}
