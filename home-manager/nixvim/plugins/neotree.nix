{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>n";
        action = ":Neotree action=focus reveal toggle<CR>";
        options.silent = true;
      }

      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree action=focus reveal toggle<CR>";
        options.silent = true;
      }
    ];

    plugins.neo-tree = {
      enable = true;

      autoCleanAfterSessionRestore = true;

      buffers.followCurrentFile.enabled = true;

      filesystem.useLibuvFileWatcher = true;

      closeIfLastWindow = true;
      window = {
        width = 30;
        autoExpandWidth = true;
      };
    };
  };
}
