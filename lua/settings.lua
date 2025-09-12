-- vim.o.nocompatible = true -- Disable compatibility to old-time vi
vim.o.showmatch = true -- Show matching brackets
vim.o.ignorecase = true -- Case insensitive matching
vim.o.hlsearch = true -- Highlight search results
vim.o.tabstop = 4 -- Number of columns occupied by a tab character
vim.o.softtabstop = 4 -- See multiple spaces as tabstops so <BS> does the right thing
vim.o.expandtab = true -- Converts tabs to white space
vim.o.shiftwidth = 4 -- Width for autoindents
vim.o.autoindent = true -- Indent a new line the same amount as the line just typed
vim.wo.number = true -- Add line numbers
vim.wo.relativenumber = true
vim.o.wildmode = "longest,list" -- Get bash-like tab completions
vim.wo.cursorline = true
vim.o.mouse = "a" -- active mouse events, apparently not needed by Iterm 2

vim.o.signcolumn = "yes"

-- Used spell languages, must go before netrw
vim.opt.spelllang = { "en", "es" }

-- Disable netrw (neovim default file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Python 3 Provider
vim.g.python3_host_prog = "~/.pyenv/versions/neovim/bin/python"
