{ inputs, ... }:

{
# Need to import nixvim home manager module
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    plugins = {
      dashboard.enable = true;
      lazy.enable = true;
      lsp.enable = true;
      cmp.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      which-key.enable = true;
      mini.enable = true;
      web-devicons.enable = true;
    };

    luaLoader.enable = true;  
  };
}
  