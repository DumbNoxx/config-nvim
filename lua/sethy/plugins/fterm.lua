return {
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup({
			dimensions = {
				height = 0.8,
				width = 0.8,
				x = 0.5,
				y = 0.5,
			},
			border = "double",
		})
	end,
	keys = {
		{ "<leader>ft", "<CMD>lua require('FTerm').toggle()<CR>", desc = "Toggle FTerm" },
		{ "<leader>FT", "<CMD>lua require('FTerm').toggle(true)<CR>", desc = "Toggle FTerm (force new)" },
	},
}
