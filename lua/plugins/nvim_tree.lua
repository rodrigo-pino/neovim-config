return {
    {
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
        config = function()
            vim.opt.termguicolors = true
            require("nvim-tree").setup({
                view = {
                    centralize_selection = true,
                    -- width = 50,
                    float = {
                        enable = false,
                    },
                },
                diagnostics = {
                    enable = true,
                },
            })

            -- mappings
            local api = require("nvim-tree.api")
            vim.keymap.set("n", "<space>e", api.tree.toggle, { silent = true })
        end
    },
}
