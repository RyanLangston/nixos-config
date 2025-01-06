{ inputs, ... }:

{
  # Need to import nixvim home manager module
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./completion.nix
    ./autocommands.nix
    ./options.nix
    ./keybindings.nix
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
      lazygit.enable = true;
    };

    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "hmts.nvim"
          "nvim-treesitter"
        ];
      };
      byteCompileLua.enable = true;
    };

    luaLoader.enable = true;
  };
}
#
