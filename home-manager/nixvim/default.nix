{ inputs, ... }:

{
  # Need to import nixvim home manager module
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./completion.nix
    ./autocommands.nix
    ./options.nix
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    plugins = {
      dashboard.enable = true;
      telescope.enable = true;
      which-key.enable = true;
      mini.enable = true;
      web-devicons.enable = true;
      lz-n.enable = true;
      nix.enable = true;
    };

    performance = {
      byteCompileLua.enable = true;
    };

    luaLoader.enable = true;
  };
}
#
