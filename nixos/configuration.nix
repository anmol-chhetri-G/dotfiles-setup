{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./desktop.nix
    ./packages.nix
    ./users.nix
    ./hyprland.nix
    ./fonts.nix
    ./fish-shell.nix
    ./nvim.nix
    ./security-tools.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 3;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Time and locale
  time.timeZone = "Asia/Kathmandu";
  i18n.defaultLocale = "en_US.UTF-8";

  # Nix quality-of-life
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow unfree packages like Zed if needed
  nixpkgs.config.allowUnfree = true;

  # Compatibility for running non-Nix binaries
  programs.nix-ld.enable = true;

  # Keep this unchanged
  system.stateVersion = "26.05";
  hardware.bluetooth.enable = true;
}
