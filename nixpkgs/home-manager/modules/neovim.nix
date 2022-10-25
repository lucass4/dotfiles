{ config, lib, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lualine-nvim
      nvim-web-devicons
      plenary-nvim
      telescope-nvim
      popup-nvim
      nvim-treesitter
      lspkind-nvim
      lspsaga-nvim

      nvim-lspconfig
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp

      cmp-vsnip
      vim-vsnip
    ];

    extraConfig = (builtins.concatStringsSep "\n"
      [ 
      #(builtins.readFile ./nvim/plugin/cmp.vim) 
      ]
      );

  };

}
