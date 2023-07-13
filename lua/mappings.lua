vim.g.mapleader = ","

-- Treat long lines as multi lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true })

-- Save with Ctrl-S
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true });

-- Delete the buffer without deleting the window
vim.keymap.set('n', '<leader>d', ':BufferLineCyclePrev\\|bd #<CR>', { noremap = true, silent = true })

-- Move through windows using local handles
-- vim.api.nvim_set_keymap('n', '˙', '<C-w>h', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '∆', '<C-w>j', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '˚', '<C-w>k', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '¬', '<C-w>l', { noremap = true, silent = true })
vim.g.tmux_navigator_no_mappings = 1
vim.api.nvim_set_keymap('n', '˙', ':TmuxNavigateLeft<CR>', { noremap = true, silent = true, })
vim.api.nvim_set_keymap('n', '∆', ':TmuxNavigateDown<CR>', { noremap = true, silent = true, })
vim.api.nvim_set_keymap('n', '˚', ':TmuxNavigateUp<CR>', { noremap = true, silent = true, })
vim.api.nvim_set_keymap('n', '¬', ':TmuxNavigateRight<CR>', { noremap = true, silent = true, })
vim.api.nvim_set_keymap('n', '÷', ':TmuxNavigatePrevious<CR>', { noremap = true, silent = true, })

-- BufferLine (move buffers around)
vim.keymap.set('n', '<leader>bp', ':BufferLineTogglePin<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bd', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-n>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '˜', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'π', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })

-- Harpoon (mark files)
vim.keymap.set('n', 'hh', require("harpoon.mark").add_file, {})
vim.keymap.set('n', 'hm', require("harpoon.ui").toggle_quick_menu, {})
vim.keymap.set('n', 'hn', require("harpoon.ui").nav_next, {})
vim.keymap.set('n', 'hN', require("harpoon.ui").nav_prev, {})


-- Git Signs
-- to be done

-- Telescope (fuzzy finder)
-- misc
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {})
-- git
vim.keymap.set('n', '<leader>fgc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>fgs', builtin.git_status, {})
vim.keymap.set('n', '<leader>fgt', builtin.git_stash, {})
-- lsp
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fdd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>ftd', builtin.lsp_type_definitions, {})

vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
vim.keymap.set('n', '<leader>fx', builtin.builtin, {})


-- NvimTree (file explorer)
local api = require("nvim-tree.api")
vim.keymap.set('n', '<space>e', ':NvimTreeFindFileToggle<CR>', { silent = true })

-- LSP CONFIG CONFIG
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
