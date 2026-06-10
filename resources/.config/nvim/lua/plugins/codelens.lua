return {
	enabled = false,
	"oribarilan/lensline.nvim",
	tag = "2.1.0", -- or: branch = 'release/2.x' for latest non-breaking updates
	event = "LspAttach",
	config = function()
		require("lensline").setup()
	end,
}
