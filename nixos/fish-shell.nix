{ pkgs, ... }:

{
  programs.fish.enable = true;

  users.users.anmol.shell = pkgs.fish;

  environment.systemPackages = with pkgs; [
    fish
  ];

  environment.shells = with pkgs; [
    fish
    bashInteractive
  ];
}
