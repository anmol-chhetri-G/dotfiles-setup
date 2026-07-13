{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # Normal fonts
    jetbrains-mono
    fira-code
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    # Nerd Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];

  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      monospace = [
        "JetBrainsMono Nerd Font"
        "JetBrains Mono"
        "DejaVu Sans Mono"
      ];

      sansSerif = [
        "Noto Sans"
        "DejaVu Sans"
      ];

      serif = [
        "Noto Serif"
        "DejaVu Serif"
      ];

      emoji = [
        "Noto Color Emoji"
      ];
    };
  };
}
