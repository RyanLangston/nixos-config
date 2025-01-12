{ ... }:

{
  programs.git.aliases = {
    a = "add";
    aa = "add --all";
    cm = "commit -m";
    p = "push";
  };

  home.shellAliases.home-update = "home-manager switch --flake ~/nixos-config/#ryanl@bagelmachine";
}
