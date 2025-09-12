return {
	{
		"mfussenegger/nvim-lint",
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		config = function()
			local lint = require("lint")

			-- ":= vim.bo.filetype" to know the current buffer filetype
			lint.linters_by_ft = {
				-- I don't know if this makes sense
				-- gitcommit = { "commitlint" },
			}

			vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
