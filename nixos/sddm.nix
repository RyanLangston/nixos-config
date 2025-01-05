{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        kdePackages.qtstyleplugin-kvantum
        kdePackages.sddm-kcm
        (catppuccin-sddm.override {
            flavor = "macchiato";
            # font  = "Noto Sans";
            # fontSize = "9";
            background = "${./Sweet-space.png}";
            # TODO: Figure out what this does
            # loginBackground = true;
        })
  ];
    services.displayManager.sddm = {
        enable = true;
        autoNumlock = true;
        theme = "breeze";
    };
}