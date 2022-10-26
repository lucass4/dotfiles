require("nvim-treesitter")

require('nvim-treesitter.configs').setup({
  parser_install_dir = "$HOME/.config/nvim/parsers",
  ensure_installed = { "lua", "rust", "toml", "hcl", "go", "python", "yaml" },
  auto_install = true,
  highlight = {
    enable = true,
  },
  ident = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
})
vim.opt.runtimepath:append("$HOME/.config/nvim/parsers")
