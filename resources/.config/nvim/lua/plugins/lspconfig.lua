return {
	-- Use :help lspconfig-all to see all configurables
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				vim.env.HOME .. "/.config/lua",
				vim.env.LUA_LIBS,
			},
		},
	},
	-- NOTE: use :help lspconfig-all
	config = function()
		vim.lsp.enable("hyprls") -- TODO: I could attach these to an autocmd for lazy loading.
		-- honestly its very hgard to switch from lazy nvim
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("nil_ls")
		vim.lsp.enable("nixd")
		vim.lsp.enable("ast_grep")
		-- vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("gdscript")
		vim.lsp.enable("hls")
		vim.lsp.enable("pyright")
		vim.lsp.enable("arduino_language_server")
		vim.lsp.config("arduino_language_server", {
			cmd = {
				"arduino-language-server",
				"-fqbn",
				"arduino:avr:uno",
			},
		})
	end,
}
