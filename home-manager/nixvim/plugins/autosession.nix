{
  programs.nixvim.plugins.auto-session = {
    enable = false;
    settings = {
      bypass_save_filetypes = [ "neo-tree" ];
    };
  };
}
