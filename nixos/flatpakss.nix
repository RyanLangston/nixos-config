{ ... }:

{
  services.flatpak = {
    enable = true;
    update.auto.enable = false;
    packages = [
      "fr.handbrake.ghb"
    ];
  };
}
