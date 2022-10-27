{ config, xdg, lib, pkgs, ... }:
let customPlugins = {
      mason= pkgs.vimUtils.buildVimPlugin {
        name = "mason-vim";
        src = pkgs.fetchFromGitHub {
          owner = "williamboman";
          repo = "mason.nvim";
          rev = "7380bd04bd194ce7317a8a8b3f0fe144d1917e72";
          sha256 = "0f8smjl6wi52p8n1hhl5zhk8i3lpsfndxxdammyybw2vz17s0j8q";
        };
      };
    };
in
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins // customPlugins; [
      mason 
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

# missing
# mason 
# null-ls.nvim
# 
# 
# 
