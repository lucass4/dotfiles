return require("packer").startup(function(use)
	-- Speed up loading Lua modules in Neovim
	use({ "lewis6991/impatient.nvim" })
	-- Status line in nvim
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	-- Base for many nvim plugins and also dependency for telescope
	use({ "nvim-lua/plenary.nvim" })
	-- telescope-nvim # fuzzy finder for neovim
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } })
	-- Tree-sitter is a parser generator tool and an incremental parsing library
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	-- LSP configuration
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/nvim-cmp" })

	--snippet stuff
	use({
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
	})

	-- git stuff
	use({ "lewis6991/gitsigns.nvim" })

	-- mason lsp management plugin
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"folke/neodev.nvim",
	})

	-- show pending keybinds
	use({ "folke/which-key.nvim", opts = {} })

	use({ "lukas-reineke/indent-blankline.nvim" })

	use({ "j-hui/fidget.nvim", tag = "legacy", opts = {} })
	-- code formating and more
	use({ "jose-elias-alvarez/null-ls.nvim" })
	-- Tree setup
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	-- Debug Adapter Protocol
	use({ "mfussenegger/nvim-dap" })
	-- Telescope support for dap
	use({ "nvim-telescope/telescope-dap.nvim" })
	-- Autopair plugin that supports multiple characters.
	use({ "windwp/nvim-autopairs" })
	-- Colorscheme
	use({ "folke/tokyonight.nvim" })
	-- nvim comment plugin
	use({ "terrortylor/nvim-comment" })
	-- nvim ag plugin
	use({ "rking/ag.vim" })
end)
