return {
	"HiPhish/rainbow-delimiters.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local rainbow = require("rainbow-delimiters")

		---@type rainbow_delimiters.config
		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = "rainbow-delimiters.strategy.global",
				vim = "rainbow-delimiters.strategy.local",
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			priority = {
				[""] = 110,
				lua = 210,
			},
			highlight = {
				"RainbowDelimiterLevel1",
				"RainbowDelimiterLevel2",
				"RainbowDelimiterLevel3",
				"RainbowDelimiterLevel4",
				-- "RainbowDelimiterLevel5",
			},
		}
		vim.api.nvim_set_hl(0, "RainbowDelimiterLevel1", { fg = "#FFFFFF" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterLevel2", { fg = "#BFBFBF" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterLevel3", { fg = "#808080" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterLevel4", { fg = "#505060" })
	end,
}
