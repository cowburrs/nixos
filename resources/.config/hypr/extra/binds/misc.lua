-- # Miscallaneous, kind of windows pilled
hl.bind("F11", hl.dsp.window.fullscreen())
hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind("ALT + Tab", hl.dsp.focus({ workspace = "previous" }))
hl.bind("SUPER + SHIFT + s", function()
	rules.discord:set_enabled(false)
	rules.notifications:set_enabled(false)
	hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/extra/scripts/screenshot.sh"))
	hl.timer(function()
		rules.discord:set_enabled(true)
		rules.notifications:set_enabled(true)
	end, { timeout = 10000, type = "oneshot" }) --TODO: This shit it so stupid fix right now
end, { locked = true })

hl.bind("SUPER + SHIFT + o", function()
	rules.discord:set_enabled(false)
	rules.notifications:set_enabled(false)
	hl.dispatch(hl.dsp.exec_cmd("~/.config/hypr/extra/scripts/ocr.sh"))
	hl.timer(function()
		rules.discord:set_enabled(true)
		rules.notifications:set_enabled(true)
	end, { timeout = 1000, type = "oneshot" })
end, { locked = true })
hl.bind(
	"code:202",
	hl.dsp.exec_cmd("~/.config/hypr/extra/scripts/wlogout.sh"),
	{ locked = true, submap_universal = true, ignore_mods = true }
)
hl.bind(
	"CTRL + ALT + delete",
	hl.dsp.exec_cmd("~/.config/hypr/extra/scripts/wlogout.sh"),
	{ locked = true, submap_universal = true, ignore_mods = true }
)
