return {
	"folke/noice.nvim",
	event = "VeryLazy",
	priority = 100, -- needs to be loaded in first
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	keys = {
		{ "<leader>n", "", desc = "[N]oice (notifications and stuff)" },
		{
			"<S-Enter>",
			function()
				require("noice").redirect(vim.fn.getcmdline())
			end,
			mode = "c",
			desc = "Redirect Cmdline",
		},
		{
			"<leader>nl",
			function()
				require("noice").cmd("last")
			end,
			desc = "[N]oice [L]ast Message",
		},
		{
			"<leader>nh",
			function()
				require("noice").cmd("history")
			end,
			desc = "[N]oice [H]istory",
		},
		{
			"<leader>na",
			function()
				require("noice").cmd("all")
			end,
			desc = "[N]oice [A]ll",
		},
		{
			"<leader>nd",
			function()
				require("noice").cmd("dismiss")
			end,
			desc = "[N]oice [D]ismiss All",
		},
		{
			"<leader>nt",
			function()
				require("noice").cmd("pick")
			end,
			desc = "Noice Picker (Telescope/FzfLua)",
		},
		{
			"<C-f>",
			function()
				if not require("noice.lsp").scroll(4) then
					return "<c-f>"
				end
			end,
			silent = true,
			expr = true,
			desc = "Scroll Forward",
			mode = { "i", "n", "s" },
		},
		{
			"<C-b>",
			function()
				if not require("noice.lsp").scroll(-4) then
					return "<c-b>"
				end
			end,
			silent = true,
			expr = true,
			desc = "Scroll Backward",
			mode = { "i", "n", "s" },
		},
	},
}
