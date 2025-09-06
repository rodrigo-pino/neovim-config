return {
    {
	    "nvim-lualine/lualine.nvim",
        dependencies = { { "nvim-tree/nvim-web-devicons", opt = true } },
        config = function()
            require("lualine").setup({
            options = {
                theme = "auto",
                globalstatus = false,
                disabled_filetypes = {
                    "NvimTree",
                },
                extensions = {
                    "fugitive",
                    "nvim-tree",
                },
            },
            })
        end
    },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"famiu/bufdelete.nvim", -- To use delete command
		},
        opts = {
            diagnostics = "nvim_lsp",
            -- style_preset = require("bufferline").style_preset.default,
            separator_style = "slope",
            close_command = "Bdelete! %d", -- using bufdelete dependency
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    separator = true,
                },
            },
            hover = {
                enabled = true,
                delay = 200,
                reveal = { "close" },
            },
        },
        config = function()
            local bufferline = require("bufferline")
            bufferline.setup({
                options = {
                    syte_preset = bufferline.style_preset.default,
                },
            })
            -- BufferLine (move buffers around)
            vim.keymap.set("n", "<leader>bb", "<Cmd>BufferLineTogglePin<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLinePickClose<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>d", "<Cmd>Bdelete<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<C-n>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<C-p>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "˜", "<Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "π", "<Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
        end
	},
}
