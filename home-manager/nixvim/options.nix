{
  programs.nixvim = {
    clipboard = {
      # Use system clipboard
      register = "unnamedplus";

      providers.wl-copy.enable = true;
    };

    opts = {
      updatetime = 100; # Faster completion

      autoindent = true;
      # Folding
      foldlevel = 99;
    };
  };
}
