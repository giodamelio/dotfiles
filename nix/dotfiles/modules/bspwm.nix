{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bspwm
    sxhkd
    polybar
    rofi
  ];

  services.xserver = {
    windowManager.default = "bspwm";
    windowManager.bspwm.enable = true;
  };
}
