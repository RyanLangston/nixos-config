{
  programs.nixvim =  {
    opts = {
      updatetime = 100; # Faster completion

      autoindent = true;
      # Folding
      foldlevel = 99;
    };
  };
}
