hl.config({
	general = {
		-- gas_in = 2
		-- gaps_out = 3
		gaps_in = 0,
		gaps_out = 0,

		border_size = 2,

		col = { active_border = { colors = { lavender, mauve }, angle = 45 }, inactive_border = surface0 },
		resize_on_border = true,

		allow_tearing = true,

		layout = "dwindle",
		snap = {
			enabled = true,

			window_gap = 30,

			monitor_gap = 30,

			border_overlap = false,
		},
	},
})
