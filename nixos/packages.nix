{pkgs, ...}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kdePackages.kate
    kdePackages.filelight
    htop
    nil
    fzf
    mangohud
    nix-tree
    youtube-music
    kdePackages.plasma-systemmonitor
    shadps4
    qbittorrent
    protonup-qt
    yubikey-personalization
    discord
    ghostty
    neovide
    kdePackages.kleopatra
    vscode
    cryptomator
    rclone
  ];
}
