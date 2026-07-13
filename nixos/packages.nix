{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Basics
    vim
    wget
    curl
    git
    unzip
    fastfetch
    btop
    openvpn
    tldr
    tmux
    _7zip-zstd-rar

    # Terminals / editors
    alacritty
    kitty
    zed-editor
    opencode

    # Shells
    fish
    zsh

    # Hyprland desktop tools
    waybar
    rofi
    awww
    hyprlock
    hypridle
    hyprpaper
    hyprsunset
    wl-clipboard
    cliphist
    grim
    slurp
    noctalia-shell
    quickshell

    # Screenshot / annotation
    flameshot
    swappy
    satty

    # File manager / desktop utilities
    thunar
    networkmanagerapplet
    pavucontrol
    brightnessctl
    playerctl
    pamixer
    libnotify
    wlsunset
    brave
    codex

    # Programming languages 
    python3
    rustc
    cargo
    go
    nodejs
    gcc
    jdk


    # Useful laptop tools
    acpi
    powertop
    pciutils
    usbutils
    lm_sensors
    localsend
  ];

  programs.firefox.enable = true;

  programs.bash.shellAliases = {
    zed = "zeditor";
  };
}
