return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- slight improvement to diagnostics
			local signs = { Error = "", Warn = "", Hint = "", Info = "" }
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = signs.Error,
						[vim.diagnostic.severity.WARN] = signs.Warn,
						[vim.diagnostic.severity.HINT] = signs.Hint,
						[vim.diagnostic.severity.INFO] = signs.Info,
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
						[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
						[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
						[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					},
				},

				virtual_text = true,
			})

			-- lsp key maps --
			-- note: diagnostics are not exclusive to lsp servers
			-- so these can be global key bindings
			vim.keymap.set("n", "gl", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

			vim.keymap.set("n", "gK", function()
				local new_config = {
					current_line = not vim.diagnostic.config().virtual_lines,
				}

				vim.diagnostic.config({ virtual_lines = new_config })
			end, { desc = "Toggle diagnostic virtual_lines" })

			vim.api.nvim_create_autocmd("lspattach", {
				desc = "lsp actions",
				callback = function(event)
					local opts = { buffer = event.buf }
					-- most used key maps
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>t", vim.lsp.buf.type_definition, opts)

					-- this i usally access through telescope
					vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
					-- not sure what this is supposed to do
					vim.keymap.set("n", "gdc", vim.lsp.buf.declaration, opts)
					-- not sure how this one is supposed to work
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					-- I use telescope to find references
					-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
					-- Formatting with conform.nvim and not the LSP
					-- vim.keymap.set({ "n", "x" }, "<leader>ff", function()
					-- 	vim.lsp.buf.format({ async = true })
					-- end, opts)
				end,
			})

			-- list of servers enabled
			-- Go
			vim.lsp.enable("gopls")
			vim.lsp.enable("golangci_lint_ls")
			-- Rust
			vim.lsp.enable("rust_analyzer")
			-- Lua
			vim.lsp.enable("lua_ls")
			-- TOML
			vim.lsp.enable("taplo")
			-- Bash
			vim.lsp.enable("bashls")
			-- LaTex
			vim.lsp.enable("texlab")
			-- Markdown
			vim.lsp.enable("marksman")
		end,
	},

	-- lsp package manager: mason
	{
		"mason-org/mason.nvim",
		opts = {},
		run = ":masonupdate",
	},
}
