require("lazy").setup({
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
    "Mofiqul/dracula.nvim",

    -- Bars
    "nvim-lualine/lualine.nvim",
    "akinsho/bufferline.nvim",
})

require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true
    },
})
require('nvim-web-devicons').setup({
    default = true,
})

require("lualine").setup({
    options = { theme = 'auto' }
});
require("bufferline").setup({
    options = {
        diagnostics = "nvim_lsp",
    }
});
