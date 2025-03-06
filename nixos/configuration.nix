# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./nvidia.nix
    ./bigdwive.nix
    ./de
    ./boilerplate.nix
    ./packages.nix
    ./misc.nix
    ./hardware-configuration.nix
    ./tower.nix
    ./flatpakss.nix
  ];

  sops.defaultSopsFile = ../secrets/monero.enc.yaml;
  sops.age.keyFile = "/home/ryanl/.config/sops/age/keys.txt";
  
  services.xmrig = {
    enable = false;
    settings = {
      
      autosave = true;
      cpu = true;
      opencl = false;
      cuda = false;
      pools = [
        {
          coin = "monero";
          algo = null;
          url = "gulf.moneroocean.stream:10001";
          user = "49DGw1PJdoQGKdvuWK9o4vGZaf6MPLmFdRNxtyLKc3uRdXFx87XEx1mBe3iT6Zw15aYtPPGdeVUvf12xeX2iHkMyPZxNs9p";
          pass = "x";
          tls = false;
          keepalive = true;
          nicehash = false;
        }
        {
          url = "pool.supportxmr.com:443";
          user = "49DGw1PJdoQGKdvuWK9o4vGZaf6MPLmFdRNxtyLKc3uRdXFx87XEx1mBe3iT6Zw15aYtPPGdeVUvf12xeX2iHkMyPZxNs9p";
          keepalive = true;
          tls = true;
        }
      ];
    };
  };

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  services.samba.enable = true;

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  networking.hostName = "bagelmachine";

  networking.hosts = {
    "192.168.1.104" = [
      "tower.local"
      "tower"
    ];
  };
  networking.networkmanager.enable = true;

  users.users = {
    ryanl = {
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      initialPassword = "supergoodpassword";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = ["wheel" "networkmanager" "audio" "libvirtd" "docker" "video"];
      shell = pkgs.zsh;
    };
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Opinionated: forbid root login through SSH.
      PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      PasswordAuthentication = true;
    };
  };

  services.ollama = {
    enable = true;
    loadModels = [
      "deepseek-r1:8b"
      "qwen2.5-coder:1.5b-base"
      "nomic-embed-text"
    ];
  };
  programs.firefox.enable = true;
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.virt-manager.enable = true;
  programs.appimage.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings.features.cdi = true;
  hardware.nvidia-container-toolkit.enable = true;

  # Networking related stuff
  networking.networkmanager.wifi.powersave = false;
  # networking.nameservers = [
  #   "1.1.1.1"
  #   "1.0.0.1"
  #   "8.8.8.8"
  #   "8.4.4.8"
  # ];

  systemd.user.services.jellyfin-mpv-shim = {
    enable = true;
    description = "Jellyfin MPV Shim";
    after = [ "network.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.jellyfin-mpv-shim}/bin/jellyfin-mpv-shim";
      Restart = "always";
      Environment = "DISPLAY=:0";
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
