local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Some helpful mapping (unsure were to place it)
vim.g.mapleader = ","
-- Save with Ctrl-S
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- Treat long lines as multi lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
vim.api.nvim_set_keymap("v", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("v", "k", "gk", { noremap = true })

require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	-- lazy color scheme while installing plugins
	install = { colorscheme = { "habamax" } },
	-- check for updates automatically
	checker = { enabled = true },
})

-- colorscheme options
-- vim.cmd([[colorscheme catppuccin]])
-- vim.cmd([[colorscheme tokyonight]])
vim.cmd([[colorscheme kanagawa]])
