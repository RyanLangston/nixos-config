{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap = {
        preset = "super-tab";
      };
      signature.enabled = true;
      completion = {
        documentation.auto_show = true;
        documentation.auto_show_delay_ms = 150;
        ghost_text.enabled = true;
      };
    };
  };
}
