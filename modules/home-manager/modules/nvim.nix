{ config, xdg, lib, pkgs, ... }: {
  programs.neovim = { enable = true; };
  xdg.configFile = {
    # nvim = {
    #   source = ./config/nvim;
    #   recursive = true;
    # };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
