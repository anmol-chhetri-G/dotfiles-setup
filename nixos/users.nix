{ pkgs, ... }:

{
  users.users.anmol = {
    isNormalUser = true;
    description = "anmol";
    extraGroups = [
      "networkmanager"
      "wheel"
      "wireshark"
    ];

    packages = with pkgs; [
      # User-only packages can go here later
    ];
  };
}
