return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			-- load extensions
			telescope.load_extension("fzf")
			-- set key maps
			local builtin = require("telescope.builtin")
			-- most used base ones
			vim.keymap.set("n", "<space>f", builtin.find_files, {})
			vim.keymap.set("n", "<space>l", builtin.live_grep, {})
			vim.keymap.set("n", "<space>b", builtin.buffers, {})
			vim.keymap.set("n", "<space>sd", builtin.diagnostics, {})
			-- least used ones
			vim.keymap.set("n", "<leader>ff", builtin.current_buffer_fuzzy_find, {})
			vim.keymap.set("n", "<leader>fg", builtin.grep_string, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			-- for git
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
			vim.keymap.set("n", "<leader>gt", builtin.git_status, {})
			vim.keymap.set("n", "<leader>gs", builtin.git_stash, {})
			-- for lsp
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
			vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {})
			vim.keymap.set("n", "<leader>ftd", builtin.lsp_type_definitions, {})
			-- for treesitter
			vim.keymap.set("n", "<leader>ft", builtin.treesitter, {})
			-- no idea
			vim.keymap.set("n", "<leader>fx", builtin.builtin, {})
		end,
	},
}
