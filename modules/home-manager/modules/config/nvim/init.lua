-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	require("plugins")
	require("impatient")

	require("config.options")
	require("config.cmp")
	require("config.treesitter")
	require("config.telescope")
	require("config.lualine")
	require("config.tree")
	require("config.dap")
	require("config.telescope-dap")
	require("config.keymaps")
	require("config.autopairs")
	require("config.colorscheme")
	require("config.mason")
	require("config.null-ls")
	require("config.comment")
	require("config.gitsigns")
	require("config.fidget")
	require("config.indent-blankline")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
