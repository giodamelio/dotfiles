{ pkgs, ... }:

{
  imports = [
    ../users/giodamelio.nix
    ../packages/base.nix
    ../packages/unfree.nix
    ../packages/misc.nix
    ../packages/fonts.nix
    ../modules/bspwm.nix
  ];

  # Basic settings
  networking.hostName = "cadmium";
  time.timeZone = "America/Los_Angeles";

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable OpenSSH
  services.openssh.enable = true;

  # Enable sound. Including pulseaudioFull for bluetooth support
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable X11
  services.xserver = {
    enable = true;
    layout = "us";
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?
}
