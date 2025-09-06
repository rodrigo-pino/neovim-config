return {
	{
	 "Mofiqul/dracula.nvim",
 	},
	{ 
		"catppuccin/nvim", 
		name = "catppuccin", 
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				dim_inactive = {
					enabled = true,
					shade = "dark",
					percentage = 0.15,
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
		end
	},
}
