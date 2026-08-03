-- plugins/quarto.lua
return {
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("quarto").setup({})
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "markdown", "quarto", "nix" },
				callback = function()
					require("otter").activate({ "python", "lua", "bash", "python3" }, true, true, nil)
				end,
			})
		end,
	},
}
