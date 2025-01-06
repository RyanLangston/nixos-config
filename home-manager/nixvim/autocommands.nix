{
  programs.nixvim.autoCmd = [
	{
		group = "FileTypeIndent";
		pattern = "nix";
		# We need to set indent size to two for nixvim
		command = "setlocal shiftwidth=2";
	}
  ];