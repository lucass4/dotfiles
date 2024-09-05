{ config, xdg, lib, pkgs, ... }: {
  programs.neovim.enable = true;

  # Copy multiple sources into the home directory
  home.file = {
    # Copy the entire nvim directory to Neovim's config location
    ".config/nvim" = {
      source = ./config/nvim;
      recursive = true;
    };

  };

  # Set environment variables for the editor
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}

