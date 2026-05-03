return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		opts = {
			automatic_enable = true,
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = (function()
				--  Install everything here
				local servers = { "stylua", "lua-language-server", "ast-grep", "air"}

				return vim.tbl_map(function(s)
					return {
						s,
						condition = function()
							return vim.fn.executable(s) == 0
						end,
					}
				end, servers)
			end)(),

			auto_update = false,
			run_on_start = true,
			start_delay = 0000,
			debounce_hours = 0,

			integrations = {
				["mason-lspconfig"] = true,
				["mason-null-ls"] = true,
				["mason-nvim-dap"] = true,
			},
		})
		vim.cmd("MasonToolsClean")
	end,
}
