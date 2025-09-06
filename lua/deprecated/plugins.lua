require("lazy").setup({ -- Git
	-- TODO: Config keywords
	"lewis6991/gitsigns.nvim",
	-- check diffview
	"tpope/vim-fugitive",

	-- Latex Utilities
	{
		"lervag/vimtex",
		lazy = false,
	},

	-- MD Preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mdkp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},


	-- LSP Stuff
	-- Native LSP Support
	"neovim/nvim-lspconfig",
	-- Allows easy installation of lsps + other stuff
	{ "williamboman/mason.nvim", run = ":MasonUpdate" },
	"williamboman/mason-lspconfig.nvim",
	-- Auto completion for LSP
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp", -- Autocomplete based on buffer diagnostics
	{ "L3MON4D3/LuaSnip", version = "v1.*", build = "make install_jsregexp" },
	"hrsh7th/cmp-buffer", -- Autocomplete based on previous buffer words
	"hrsh7th/cmp-path", -- Autocomplete path
	"hrsh7th/cmp-nvim-lsp-signature-help", -- Signature when writing functions
	"saadparwaiz1/cmp_luasnip",
	"petertriho/cmp-git",

	-- Makes interacting with LSP easier
	{ "VonHeikemen/lsp-zero.nvim", branch = "v2.x" },
	-- Improve native lsp capabilites
	"nvimtools/none-ls.nvim",

	-- rust-tools: provides a lot of nice things for rust development
	"simrat39/rust-tools.nvim",

	-- octo.nvim for reviewing PR from the confort of my terminal :)
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},


	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
	},

	-- HELPERS
	-- Resizing Window: Ctrl-e to activate, hjkl to move and e to change modes
	"simeji/winresizer",

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},


	-- which key
	-- TODO: set documentation of my stuff!
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
})


-- Vim Tex configuration
vim.cmd("filetype plugin indent on")
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_compiler_method = "latexmk"


