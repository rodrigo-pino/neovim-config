return {
    {
        "christoomey/vim-tmux-navigator",
        config = function()
            vim.g.tmux_navigator_no_mappings = 1
            vim.api.nvim_set_keymap("n", "˙", "<Cmd>TmuxNavigateLeft<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "∆", "<Cmd>TmuxNavigateDown<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "˚", "<Cmd>TmuxNavigateUp<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "¬", "<Cmd>TmuxNavigateRight<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "÷", "<Cmd>TmuxNavigatePrevious<CR>", { noremap = true, silent = true })
        end
            
    },
}
