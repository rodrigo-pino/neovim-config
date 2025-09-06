return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- slight improvement to diagnostics
			local signs = { Error = "", Warn = "", Hint = "", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			vim.diagnostic.config({ virtual_text = true })
			-- lsp key maps --
			-- note: diagnostics are not exclusive to lsp servers
			-- so these can be global key bindings
			vim.keymap.set("n", "gl", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

			vim.api.nvim_create_autocmd("lspattach", {
				desc = "lsp actions",
				callback = function(event)
					local opts = { buffer = event.buf }
					-- most used key maps
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
					-- this i usally access through telescope
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
					vim.keymap.set({ "n", "x" }, "<leader>ff", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},

	-- lsp helper, mason
	{
		"mason-org/mason.nvim",
		run = ":masonupdate",
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp", -- autocomplete based on buffer diagnostics
		},

		config = function()
			-- important setup for lspconfig (based on lsp zero)
			-- defining it here since it needs: cmp, lsp_config and mason
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
			local default_setup = function(server)
				require("lspconfig")[server].setup({
					capabilites = lsp_capabilities,
				})
			end

			-- custom lsp configuration should come here

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {},
				handlers = {
					default_setup,
				},
			})
		end,
	},
}
