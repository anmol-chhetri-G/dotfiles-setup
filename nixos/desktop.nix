{ ... }:

{
  # X server base, still useful for GDM/GNOME integration
  services.xserver.enable = true;

  # Display manager + GNOME
  services.displayManager.gdm.enable = false;
  services.xserver.desktopManager.gnome.enable = false;

  # ly for login
  services.displayManager.ly.enable = true;

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Printing
  services.printing.enable = true;

  # Sound via PipeWire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.polkit.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
}
