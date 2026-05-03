local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		icons_enabled = true,
		theme = "Catppuccin Macchiato",
		tabs_enabled = true,
		theme_overrides = {},
		section_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
		component_separators = {
			left = wezterm.nerdfonts.pl_left_soft_divider,
			right = wezterm.nerdfonts.pl_right_soft_divider,
		},
		tab_separators = {
			-- left = wezterm.nerdfonts.pl_left_hard_divider,
			-- right = wezterm.nerdfonts.pl_right_hard_divider,
			left = "",
			right = "",
		},
	},
	sections = {
		tabline_a = {},
		tabline_b = {},
		tabline_c = {  },
		tab_active = {
			"index",
			"process",
		},
		tab_inactive = { "index" , "process"},
		tabline_x = {},
		tabline_y = { "hostname" },
		tabline_z = { "mode" },
	},
	extensions = {},
})
return {tabline, {enable = true}}
-- Window
--     mode (current keytable)
--     battery (battery percentage)
--     cpu (cpu percentage)
--     datetime (current date and time)
--     domain (current domain)
--     hostname (hostname of the machine)
--     ram (ram used in GB)
--     window (window title)
--     workspace (active wezterm workspace)
-- Tab
--     tab (tab title)
--     cwd (current working directory)
--     output (indicator if tab has unseen output)
--     parent (parent directory)
--     process (process name)
--     index (tab index)
--     zoomed (indicator if tab has zoomed pane)
