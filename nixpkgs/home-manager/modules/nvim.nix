{ config, lib, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lualine-nvim # status line in nvim
      nvim-web-devicons # pluging icons
      plenary-nvim # base for many nvim plugins
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
    ];

     extraConfig = builtins.concatStringsSep "\n" [
      ''
      (luafile /config/nvim/init_lua.lua)
      ''
     ];
  };

}
