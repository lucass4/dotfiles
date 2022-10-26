{ config, xdg, lib, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lualine-nvim # status line in nvim
      nvim-web-devicons # pluging icons and dependency for lualine-nvim 
      plenary-nvim # base for many nvim plugins and also dependency for telescope
      telescope-nvim # fuzzy finder for neovim
      nvim-treesitter # treesitter abstraction for treesitter 

      ## LSP configuration
      nvim-lspconfig
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      cmp-vsnip
      vim-vsnip

      ## tree setup
      nvim-tree-lua
      nvim-web-devicons
    ];

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
