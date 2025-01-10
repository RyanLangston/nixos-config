{
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "macchiato";
      integrations = {
        which_key = true;
        barbar = true;
        blink_cmp = true;
      };
    };
  };
}
