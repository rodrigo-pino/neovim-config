require("lazy").setup({
    -- Git
    -- TODO: Config keywords
    "lewis6991/gitsigns.nvim",
    -- check diffview
    -- check vimfugitive

    -- Syntasx Highlighting
    "nvim-treesitter/nvim-treesitter",

    -- Native LSP Support
    "neovim/nvim-lspconfig",
    -- Remove LSP Boiler plate + UI
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Auto completion for LSP
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    -- Boiler plate to connect LSP with CMP
    { "VonHeikemen/lsp-zero.nvim", branch = "v2.x" },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        }
    },

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },

    -- Themes
    { "Mofiqul/dracula.nvim",      priority = -1000 },

    -- Bars
    "nvim-lualine/lualine.nvim",
    -- TODO: See how to modify tabs to my pleasing
    { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },

    -- Helpers
    -- Resizing Window: Ctrl-e to activate, hjkl to move and e to change modes
    'simeji/winresizer',

    -- which key?
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
        }
    }
})

require("gitsigns").setup({
    current_line_blame = true
});

require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true
    },
})
require('nvim-web-devicons').setup({
    default = true,
})

-- This needs to go before bufferline
vim.cmd([[colorscheme dracula]])
vim.cmd 'highligh NormalFloat guibg=#21232c'
vim.cmd 'highlight FloatBorder guibg=#21232c'

require("lualine").setup({
    options = { theme = 'auto' }
});
local bufferline = require("bufferline")
bufferline.setup({
    options = {
        diagnostics = "nvim_lsp",
        style_preset = bufferline.style_preset.default,
        separator_style = "slope",
        show_buffer_close_icons = false,
        offsets = {
            filetype = "NvimTree",
            text = "File Explorer",
            separator = true,
            highlight = "Directory",
            text_align = "left",
        }
    }
});
