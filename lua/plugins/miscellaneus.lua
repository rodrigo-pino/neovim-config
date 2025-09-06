return {
	-- highlighting things afteter a while
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				delay = 555,
			})
		end,
	},

	-- Resizing Window: Ctrl-e to activate, hjkl to move and e to change modes
	"simeji/winresizer",

	-- add another pair
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}
