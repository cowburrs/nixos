return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	config = function()
		require("cord").setup({
			display = {
				theme = "catppuccin",
				flavor = "dark",
				view = "full",
				swap_fields = false,
				swap_icons = false,
			},
		})
	end,
	-- opts = {}
}
