-- LSP ZERO CONFIG
local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- CMP CONFIG
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "nvim_lsp_signature_help" },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
})

-- NULL LS
local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	border = "rounded",
	-- Format on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.csharpier,
		-- null_ls.builtins.formatting.clang_format,

		null_ls.builtins.code_actions.gitsigns,

		-- Requires a config file ugh
		-- null_ls.builtins.diagnostics.commitlint,
		null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.diagnostics.solhint,
	},
})

-- MASON CONFIG
require("mason").setup()
require("mason-lspconfig").setup()

local util = require("lspconfig.util")

-- Setting custom language server through MASON
require("lspconfig.configs").cairo_language_server = {
	default_config = {
		name = "cairo-language-server",
		cmd = { "cairo-language-server" },
		filetypes = { "cairo" },
		root_dir = function(fname)
			return util.root_pattern("Scarb.toml")(fname)
				or util.root_pattern("Scarb.toml", "cairo_project.toml", ".git")(fname)
		end,
	},
}
require("lspconfig").cairo_language_server.setup({})

-- Diagnostics
-- Change default sideline diagnostics
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
