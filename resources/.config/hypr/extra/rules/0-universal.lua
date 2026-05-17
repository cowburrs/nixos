hl.window_rule({
	name = "maximizeignore",
	suppress_event = "maximize",
	match = { class = ".*" },
})
hl.window_rule({
	name = "dragissues",
	no_focus = true,
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
})
hl.window_rule({
	name = "smartgaps",
	border_size = 2,
	border_color = base,
	match = {
		float = false,
		workspace = "w[tv1]",
	},
})
hl.window_rule({
	name = "smartgaps2",
	border_size = 0,
	match = {
		float = false,
		workspace = "f[1]",
	},
})
rules.notifications = hl.layer_rule({
	name = "notifications",
	no_screen_share = true,
	match = { namespace = "notifications" },
})
