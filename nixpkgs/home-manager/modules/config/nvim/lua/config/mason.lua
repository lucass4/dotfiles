require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = { 
    "sumneko_lua", 
    "rust_analyzer", 
    "bashls", 
    "dockerls", 
    "golangci_lint_ls", 
    "gopls", 
    "grammarly", 
    "tsserver", 
    "marksman", 
    "jedi_language_server", 
    "taplo", 
    "terraformls", 
    "tflint"
  }})
