{ config, lib, pkgs, ... }:
{
programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
	lualine-nvim
  	nvim-web-devicons
        plenary-nvim
        telescope-nvim
        popup-nvim
        nvim-lspconfig
        nvim-treesitter
        coq_nvim
        cmp-nvim-lsp
        cmp-buffer
        nvim-cmp
        lspkind-nvim
        defx-git
        defx-icons
        defx-nvim
        lspsaga-nvim
    ];
  };
}
