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
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = false}),
    }
})

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
            return util.root_pattern 'Scarb.tom' (fname)
                or util.root_pattern('Scarb.toml', 'cairo_project.toml', '.git')(fname)
        end,
    }
}
require('lspconfig').cairo_language_server.setup({})

