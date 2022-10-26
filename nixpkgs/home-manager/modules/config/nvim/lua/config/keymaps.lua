local opts = { noremap = true, silent = true }

--Remap space as leader key
vim.keymap.set('', '<Space>', '<Nop>', opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
