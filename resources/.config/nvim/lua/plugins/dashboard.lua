return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                     ]],
					[[       ████ ██████           █████      ██                     ]],
					[[      ███████████             █████                             ]],
					[[      █████████ ███████████████████ ███   ███████████   ]],
					[[     █████████  ███    █████████████ █████ ██████████████   ]],
					[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
					[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
					[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
					[[                                                                       ]],
					[[                                                                       ]],
				},
				center = {
					{
						action = "lua require('telescope.builtin').find_files()",
						desc = " Find [F]ile",
						icon = " ",
						key = "f",
					},
					{
						action = "lua require('telescope.builtin').live_grep()",
						desc = " Find [T]ext",
						icon = " ",
						key = "t",
					},
					{
						action = "ene | startinsert",
						desc = " [N]ew File",
						icon = " ",
						key = "n",
					},
					{
						action = 'lua require("persistence").load()',
						desc = " [R]estore Session",
						icon = " ",
						key = "r",
					},
					{
						action = function()
							vim.api.nvim_input("<cmd>Tfm<cr>")
						end,
						desc = " File [m]anager",
						icon = " ",
						key = "m",
					},
					{
						action = function()
							vim.api.nvim_input("<cmd>qa<cr>")
						end,
						desc = " [Q]uit",
						icon = " ",
						key = "q",
					},
				},
			},
			-- config
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
