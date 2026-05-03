return {
	"stevearc/conform.nvim",

	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {},
	config = function()
		vim.filetype.add({
			extension = { rasi = "rasi" },
			pattern = {
				[".*/waybar/config"] = "jsonc",
				[".*/mako/config"] = "dosini",
				[".*/kitty/*.conf"] = "bash",
				[".*/hypr/.*%.conf"] = "hyprlang",
			},
		})
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettier", stop_after_first = true },
				clojure = { "zprint" },
				nix = { "nixfmt" },
				json = { "prettier" },
				jsonc = { "biome" },
				sh = { "beautysh" },
				rust = { "rustfmt" },
				rs = { "rustfmt" },
				haskell = { "ormolu" },
				toml = { "taplo" },
				cs = { "csharpier" },
			},
		})
	end,
}
