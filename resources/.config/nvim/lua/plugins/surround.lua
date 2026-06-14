return {
	dependencies = {
		{
			"kylechui/nvim-surround",
			-- version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
			dependencies = {},
			config = function()
				require("nvim-surround").setup({
					add_space = false,
					surrounds = {
						["w"] = {
							add = function()
								local delimiter = require("nvim-surround.config").get_input("Enter delimiter: ")
								if delimiter then
									return { { delimiter }, { delimiter } }
								end
							end,
							find = function() end,
							delete = function() end,
							label = "<word>...<word>"
						},
					},
				})
				vim.keymap.set("n", "ys", "<Plug>(nvim-surround-normal)", {
					desc = "Add a surrounding pair around a motion (normal mode)",
				})
				vim.keymap.set("n", "yss", "<Plug>(nvim-surround-normal-cur)", {
					desc = "Add a surrounding pair around the current line (normal mode)",
				})
				vim.keymap.set("n", "yS", "<Plug>(nvim-surround-normal-line)", {
					desc = "Add a surrounding pair around a motion, on new lines (normal mode)",
				})
				vim.keymap.set("n", "ySS", "<Plug>(nvim-surround-normal-cur-line)", {
					desc = "Add a surrounding pair around the current line, on new lines (normal mode)",
				})
				vim.keymap.set("x", "S", "<Plug>(nvim-surround-visual)", {
					desc = "Add a surrounding pair around a visual selection",
				})
				vim.keymap.set("x", "gS", "<Plug>(nvim-surround-visual-line)", {
					desc = "Add a surrounding pair around a visual selection, on new lines",
				})
				vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)", {
					desc = "Delete a surrounding pair",
				})
				vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)", {
					desc = "Change a surrounding pair",
				})
				vim.keymap.set("n", "cS", "<Plug>(nvim-surround-change-line)", {
					desc = "Change a surrounding pair, putting replacements on new lines",
				})
			end,
		},
	},
	"gregorias/nvim-surround-wk",
	config = true,
}
-- bruh sal[ and sal] are differnt fucking things
