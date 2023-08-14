-- -- Set up nvim-cmp.
-- local cmp = require("cmp")
--
-- cmp.setup({
-- 	snippet = {
-- 		-- REQUIRED - you must specify a snippet engine
-- 		expand = function(args)
-- 			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
-- 		end,
-- 	},
-- 	window = {
-- 		completion = cmp.config.window.bordered(),
-- 		documentation = cmp.config.window.bordered(),
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 		["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 		["<C-Space>"] = cmp.mapping.complete(),
-- 		["<C-e>"] = cmp.mapping.abort(),
-- 		["<CR>"] = cmp.mapping.confirm({ select = true }),
-- 	}),
-- 	sources = cmp.config.sources({
-- 		{ name = "path" }, -- file paths
-- 		{ name = "nvim_lsp" },
-- 		{ name = "vsnip" },
-- 	}, {
-- 		{ name = "buffer" },
-- 	}),
-- })
--
-- -- Set configuration for specific filetype.
-- cmp.setup.filetype("gitcommit", {
-- 	sources = cmp.config.sources({
-- 		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
-- 	}, {
-- 		{ name = "buffer" },
-- 	}),
-- })
--
-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ "/", "?" }, {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = "buffer" },
-- 	},
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 	}, {
-- 		{ name = "cmdline" },
-- 	}),
-- })
--
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete({}),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_installer = require("mason-lspconfig")
local lspconfig = require("lspconfig")

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server].setup({
    capabilities = capabilities,
  })
end
