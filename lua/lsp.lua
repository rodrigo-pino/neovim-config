-- LSP ZERO CONFIG
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup();


-- CMP CONFIG
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }
})

-- NULL LS
-- local null_ls = require("null-ls")
-- 
-- null_ls.setup({
--     sources = {
--         null_ls.builtins.formatting.stylua,
--         null_ls.builtins.diagnostics.eslint,
--         null_ls.builtins.completion.spell,
--     },
-- })

-- MASON CONFIG
require("mason").setup()
require("mason-lspconfig").setup()


local util = require 'lspconfig.util'

-- Setting custom language server through MASON
require('lspconfig.configs').cairo_language_server = {
    default_config = {
        name = 'cairo-language-server',
        cmd = { 'cairo-language-server' },
        filetypes = { 'cairo' },
        root_dir = function(fname)
            return util.root_pattern 'Scarb.toml' (fname)
                or util.root_pattern('Scarb.toml', 'cairo_project.toml', '.git')(fname)
        end,
    }
}
require('lspconfig').cairo_language_server.setup({})

-- Diagnostics
-- Change default sideline diagnostics
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
