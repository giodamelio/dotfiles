{ pkgs, ... }:

{
  imports = [
    ../users/giodamelio.nix
    ../packages/base.nix
    ../packages/unfree.nix
    ../packages/misc.nix
    ../packages/games.nix
    ../packages/fonts.nix
    # ../packages/virtualization.nix
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

  # Enable sway
  programs.sway.enable = true;

  # Enable Docker
  virtualisation.docker.enable = true;

  # Enable Avahi
  services.avahi = {
    enable = true;
    nssmdns = true;
    publish = {
      enable = true;
      addresses = true;
    };
  };

  # # Enable VirtualBox virtulization
  # virtualisation.virtualbox.host.enable = true;
  #
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?
}
