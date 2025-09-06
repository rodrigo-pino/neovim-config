return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"windwp/nvim-autopairs",
			"hrsh7th/cmp-path", -- Autocomplete path
			"hrsh7th/cmp-buffer", -- Autocomplete based on previous buffer words
			-- LSP Specific
			"hrsh7th/cmp-nvim-lsp", -- Autocomplete based on buffer diagnostics
			"hrsh7th/cmp-nvim-lsp-signature-help", -- Signature when writing functions
			"saadparwaiz1/cmp_luasnip", -- Autocomplete function names
			{ "L3MON4D3/LuaSnip", version = "v1.*", build = "make install_jsregexp" },
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					-- Enter key confirms completion item
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					-- Ctrl + space triggers completion menu
					["C-Space>"] = cmp.mapping.complete(),
				}),
				sources = {
					{ name = "path" },
					-- {
					-- 	name = "buffer",
					-- 	keyword_length = 3,
					-- },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{
						name = "luasnip",
						keyword_length = 2,
					},
				},
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
