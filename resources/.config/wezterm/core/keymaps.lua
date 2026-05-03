local wezterm = require("wezterm")
local act = wezterm.action

return {
	disable_default_key_bindings = true,
	keys = {
		{
			key = "c",
			mods = "CTRL",
			action = act.CopyTo("Clipboard"),
		},
		{
			key = "v",
			mods = "CTRL",
			action = act.PasteFrom("Clipboard"),
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = act.PasteFrom("Clipboard"),
		},
		{
			key = "t",
			mods = "CTRL",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "Tab",
			mods = "CTRL",
			action = act.ActivateTabRelative(1),
		},
		{
			key = "Tab",
			mods = "CTRL|SHIFT",
			action = act.ActivateTabRelative(-1),
		},
		{
			key = "Tab",
			mods = "CTRL|SHIFT",
			action = act.ActivateTabRelative(-1),
		},
		{
			key = "w",
			mods = "CTRL",
			action = act.CloseCurrentTab({ confirm = true }),
		},
		{
			key = "l",
			mods = "CTRL|SHIFT",
			action = act.ShowDebugOverlay,
		},
		{
			key = "p",
			mods = "CTRL|SHIFT",
			action = act.EmitEvent("user-defined-0"),
		},
		{
			key = "p",
			mods = "CTRL|SHIFT|ALT",
			action = act.EmitEvent("user-defined-1"),
		},
		{
			key = "1",
			mods = "CTRL",
			action = act.ActivateTab(0),
		},
		{
			key = "2",
			mods = "CTRL",
			action = act.ActivateTab(1),
		},
		{
			key = "3",
			mods = "CTRL",
			action = act.ActivateTab(2),
		},
		{
			key = "4",
			mods = "CTRL",
			action = act.ActivateTab(3),
		},
		{
			key = "5",
			mods = "CTRL",
			action = act.ActivateTab(4),
		},
		{
			key = "6",
			mods = "CTRL",
			action = act.ActivateTab(5),
		},
		{
			key = "7",
			mods = "CTRL",
			action = act.ActivateTab(6),
		},
		{
			key = "8",
			mods = "CTRL",
			action = act.ActivateTab(7),
		},
		{
			key = "9",
			mods = "CTRL",
			action = act.ActivateTab(8),
		},
		{
			key = "0",
			mods = "CTRL",
			action = act.ActivateTab(9),
		},
		{
			key = "X",
			mods = "CTRL|SHIFT",
			action = act.ActivateCopyMode,
		},
		{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = act.ResetFontSize },
	},
}
