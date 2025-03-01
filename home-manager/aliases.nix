{ ... }:

{
  programs.git.aliases = {
    a = "add";
    aa = "add --all";
    cm = "commit -S -m";
    p = "push";
  };

  home.shellAliases.home-update = "home-manager switch --flake ~/nixos-config/#ryanl@bagelmachine";
  home.shellAliases.home-news = "home-manager news --flake ~/nixos-config/#ryanl@bagelmachine";
}
