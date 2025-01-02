{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    (pkgs.stdenv.mkDerivation rec {
      pname = "sddm-sweet-mars-theme";
      version = "1.0";
      dontBuild = true;

      installPhase = ''
        mkdir -p $out/share/sddm/themes/sweet-mars
        tar -xvf ${./Sweet-Mars.tar.xz} --strip-components=1 -C $out/share/sddm/themes/sweet-mars
      '';

      src = ./.; # Ensures that Nix includes local files in its store for reproducibility
    })
  ];

#   services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.theme = "sweet-mars";
}
