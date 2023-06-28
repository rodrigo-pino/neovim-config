-- Clone lazy package manager if it does not exists
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.o.nocompatible = true  -- Disable compatibility to old-time vi
vim.o.showmatch = true  -- Show matching brackets
vim.o.ignorecase = true  -- Case insensitive matching
vim.o.hlsearch = true  -- Highlight search results
vim.o.tabstop = 4  -- Number of columns occupied by a tab character
vim.o.softtabstop = 4  -- See multiple spaces as tabstops so <BS> does the right thing
vim.o.expandtab = true  -- Converts tabs to white space
vim.o.shiftwidth = 4  -- Width for autoindents
vim.o.autoindent = true  -- Indent a new line the same amount as the line just typed
vim.wo.number = true  -- Add line numbers
-- vim.o.wildmode = "longest,list"  -- Get bash-like tab completions
vim.wo.cursorline = true
vim.o.splitbelow = true  -- Split windows below the current one
vim.o.splitright = true  -- Split windows to the right of the current one

vim.o.signcolumn = "yes"

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- allow highlight groups
vim.opt.termguicolors = true

-- Python 3 Provider
vim.g.python3_host_prog='~/.pyenv/versions/neovim/bin/python'
vim.cmd [[filetype plugin indent on]]
