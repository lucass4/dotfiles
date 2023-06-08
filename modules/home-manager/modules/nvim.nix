{ config, xdg, lib, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ packer-nvim ];
  };
  xdg.configFile = {
    nvim = {
      source = ./config/nvim;
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
