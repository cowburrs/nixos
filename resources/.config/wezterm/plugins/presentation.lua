local wezterm = require("wezterm")
local presentation = wezterm.plugin.require("https://gitlab.com/xarvex/presentation.wez")
local config = {
	presentation = {
		enabled = true,
		keybind = { key = "p", mods = "CTRL|ALT" },
		-- font_weight:          active font weight
		-- font_size_multiplier: multiplier for font size
	},
	presentation_full = {
		enabled = true,
		keybind = { key = "p", mods = "CTRL|ALT|SHIFT" },
		-- font_weight:         active font weight
		-- font_size_multipler: multiplier for font size
	},
	font_weight = "DemiBold", -- active font weight for both modes
	font_size_multiplier = 2.0, -- multiplier for font size for both modes
}
return { presentation, config }
