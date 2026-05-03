local wezterm = require("wezterm")

return {
	color_scheme = "Catppuccin Macchiato",
	-- color_scheme = "tokyonight",
	font_size = 13,
	window_padding = {
		left = "0cell",
		right = "0cell",
		top = "0.5cell",
		bottom = "0.0cell",
	},
	font = wezterm.font("JetBrainsMono Nerd Font"),
	use_resize_increments = true,
	-- font = wezterm.font("Aporetic Sans Mono"),

	hide_tab_bar_if_only_one_tab = true,
	window_background_opacity = 0.9,
	text_background_opacity = 1, -- change neovim transparency
	window_decorations = "NONE",
	enable_kitty_keyboard = true,
}
