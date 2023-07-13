require("lazy").setup({ -- Git
	-- TODO: Config keywords
	"lewis6991/gitsigns.nvim",
	-- check diffview
	"tpope/vim-fugitive",

	-- Syntasx Highlighting
	"nvim-treesitter/nvim-treesitter",

	-- TMUX Config
	"christoomey/vim-tmux-navigator",

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

	-- Makes interacting with LSP easier
	{ "VonHeikemen/lsp-zero.nvim", branch = "v2.x" },
	-- Improve native lsp capabilites
	"jose-elias-alvarez/null-ls.nvim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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

	-- Themes
	{ "Mofiqul/dracula.nvim" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- Bars
	"nvim-lualine/lualine.nvim",
	-- TODO: See mouse hover events
	-- TODO: See how get side tree offset
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"famiu/bufdelete.nvim", -- To use delete command
		},
	},
	-- TODO: See mouse hover events
	-- TODO: See how get side tree offset
	-- TODO: How to get pretty theme
	-- {
	-- 	"romgrk/barbar.nvim",
	-- 	dependencies = {
	-- 		"lewis6991/gitsigns.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	init = function()
	-- 		vim.g.barbar_auto_setup = false
	-- 	end,
	--     opts = {
	--         animation = true,
	--         icons = {
	--              button = 'k',
	--              separator = {left = "/", right = ''}
	--         },
	--         sidebar_filetypes = {
	--             NvimTree = true,
	--         }
	--     },
	-- 	version = "1.0.0",
	-- },

	-- HELPERS
	-- Resizing Window: Ctrl-e to activate, hjkl to move and e to change modes
	"simeji/winresizer",

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	"RRethy/vim-illuminate",

	-- which key
	-- TODO: set documentation of my sutff!
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

require("gitsigns").setup({
	current_line_blame = true,
})

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
})

require("nvim-web-devicons").setup({
	default = true,
})

-- Themes needs to go before bufferline
------------------ Dracula Config -------------------
-- vim.cmd([[colorscheme dracula]])
-- vim.cmd 'highligh NormalFloat guibg=#21232c'
-- vim.cmd 'highlight FloatBorder guibg=#21232c'
---------------- Cattpuccin Config ------------------
require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = "0.15",
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		harpoon = true,
		mason = true,
		which_key = true,
	},
})
vim.cmd([[colorscheme catppuccin]])

require("lualine").setup({
	options = {
		theme = "auto",
		globalstatus = false,
		disabled_filetypes = {
			"NvimTree",
		},
		extensions = {
			"fugitive",
			-- 'nvim-tree',
		},
	},
})

local bufferline = require("bufferline")
bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		style_preset = bufferline.style_preset.default,

		separator_style = "slope",

		close_command = "Bdelete! %d", -- using bufdelete dependency

		-- This appears not to be working
		offsets = {
			filetype = "NvimTree",
			text = "File Explorer",
			separator = true,
		},
		-- This appears not to be working
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
	},
})

require("illuminate").configure({
	delay = 555,
})
--vim.cmd([[highligh IlluminatedWordRead  guibg=#21222c gui=none]])
