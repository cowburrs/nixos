-- # Miscallaneous, kind of windows pilled
hl.bind("F11", hl.dsp.window.fullscreen())
hl.bind("ALT + F4", hl.dsp.window.close())
hl.bind("ALT + Tab", hl.dsp.focus({ workspace = "previous" }))
local function imagefunc(file)
	return function()
		rules.discord:set_enabled(false)
		rules.notifications:set_enabled(false)
		hl.dispatch(
			hl.dsp.exec_cmd(
				"~/.config/hypr/extra/scripts/"
					.. file
					.. ".sh && hyprctl eval 'rules.discord:set_enabled(true)' && hyprctl eval 'rules.notifications:set_enabled(true)'"
			)
		)
	end
end
hl.bind("SUPER + SHIFT + s", imagefunc("screenshot"), { locked = true })
hl.bind("SUPER + SHIFT + o", imagefunc("ocr"), { locked = true })
hl.bind("SUPER + SHIFT + i", imagefunc("qr"), { locked = true })

hl.bind(
	"code:202",
	hl.dsp.exec_cmd("~/.config/hypr/extra/scripts/wlogout.sh"),
	{ locked = true, submap_universal = true, ignore_mods = true }
)
hl.bind(
	"CTRL + ALT + delete",
	hl.dsp.exec_cmd("~/.config/hypr/extra/scripts/wlogout.sh"),
	{ locked = true, submap_universal = true, ignore_mods = false, bypass = true }
)
