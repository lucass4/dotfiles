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

      nvim-dap # Debug Adapter Protocol
      telescope-dap-nvim # telescope support for dap

      impatient-nvim # Speed up loading Lua modules in Neovim 

      nvim-autopairs # A super powerful autopair plugin for Neovim that supports multiple characters.

      tokyonight-nvim # colorscheme
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
