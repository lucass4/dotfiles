local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	sources = {
		-- refactoring
		require("null-ls").builtins.code_actions.refactoring,

		-- lua
		require("null-ls").builtins.formatting.stylua,

		-- go
		require("null-ls").builtins.formatting.goimports,
		require("null-ls").builtins.formatting.golines,
		require("null-ls").builtins.diagnostics.revive,

		--nix
		require("null-ls").builtins.formatting.nixfmt,
		require("null-ls").builtins.formatting.nixpkgs_fmt,

		-- python
		require("null-ls").builtins.formatting.autopep8,
		require("null-ls").builtins.diagnostics.pycodestyle,
		-- Markup languages
		require("null-ls").builtins.formatting.prettier,

		--bash
		require("null-ls").builtins.formatting.shfmt,

		-- rust
		require("null-ls").builtins.formatting.rustfmt,

		-- terraform
		require("null-ls").builtins.formatting.terraform_fmt,
		require("null-ls").builtins.formatting.terrafmt,

		-- docker
		require("null-ls").builtins.diagnostics.hadolint,

		--helm lint
		require("null-ls").builtins.diagnostics.haml_lint,
	},
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
