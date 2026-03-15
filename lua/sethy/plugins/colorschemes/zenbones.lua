return {
	"zenbones-theme/zenbones.nvim",
	dependencies = "rktjmp/lush.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("tokyobones")
		local groups = {
			"Normal",
			"NormalNC",
			"SignColumn",
			"LineNr",
			"EndOfBuffer",
			"NormalFloat",
			"FloatBorder",
			"MiniFilesNormal",
			"MiniFilesBorder",
			"MiniFilesTitle",
		}
		for _, group in ipairs(groups) do
			vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
		end
	end,
}
