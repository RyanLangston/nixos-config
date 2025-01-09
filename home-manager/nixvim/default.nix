{ inputs, ... }:

{
  # Need to import nixvim home manager module
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./options.nix
    ./keybindings.nix
    ./completion.nix
  ];

  home.shellAliases.v = "nvim";

  home.shellAliases.home-update = "home-manager switch --flake ~/nixos-config/#ryanl@bagemachine";

  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    plugins = {
      which-key.enable = true;
      mini.enable = true;
      web-devicons.enable = true;
      lz-n.enable = true;
      nix.enable = true;
      fzf-lua.enable = true;
      nvim-autopairs.enable = true;
      auto-session.enable = true;
      direnv.enable = true;
      precognition.enable = true;
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

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
#
