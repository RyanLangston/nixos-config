{
  programs.nixvim.plugins.auto-session = {
    enable = true;
    settings = {
      bypass_save_filetypes = [ "neo-tree" ];
    };
  };
}
