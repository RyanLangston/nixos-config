{ inputs, ...}:

{
  # Need to import nixvim home manager module
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    lualoader.enable = true;
  };

}