local function openOrMove(cmd, search)
	return function()
		if #hl.get_windows(search) == 0 then
			hl.dispatch(hl.dsp.exec_cmd(cmd))
		else
			if hl.get_active_window() ~= hl.get_windows(search)[1] then
				hl.dispatch(
					hl.dsp.exec_cmd(
						"play ~/.config/hypr/extra/sfx/WORKSPACE-MOVE.wav trim 0.025 vol 0.025 pitch $((RANDOM % 150 - 100)) # Play slightly depitched noise"
					)
				)
				hl.dispatch(hl.dsp.focus({ window = hl.get_windows(search)[1] }))
			end
		end
	end
end
local function appBind(key, cmd, search)
	hl.bind(AppBind .. "+" .. key, openOrMove(cmd, search))
end
-- bind = $appBind, w, exec, pkill waybar && waybar &
appBind("f", "qutebrowser", { class = "org.qutebrowser.qutebrowser" })
appBind("d", "discord", { class = "discord" })
appBind("a", "anki", { class = "anki" })
appBind("m", "thunderbird", { class = "thunderbird" })
appBind("g", "steam", { class = "steam" })
appBind("p", "spotify", { class = "Spotify" })
appBind("n", "logseq", { class = "Logseq" })
hl.bind(AppBind .. "+" .. "w", hl.dsp.exec_cmd("pkill waybar && waybar"))

local function mbind(keys, dispatch, opts)
	hl.bind(mainMod .. "+" .. keys, dispatch, opts)
end

mbind("RETURN", hl.dsp.exec_cmd(Terminal))
mbind("SPACE", hl.dsp.exec_cmd(Menu))
mbind("Q", hl.dsp.window.close())
mbind("C", hl.dsp.exec_cmd("makoctl dismiss -a")) -- TODO: Make dismiss win nd instead
mbind("I", hl.dsp.exec_cmd("rofi-network-manager"))
mbind("F", hl.dsp.window.fullscreen({ mode = "maximized" }))
mbind("O", hl.dsp.exec_cmd("~/.config/hypr/extra/scripts/hyprlock.sh"))
mbind("V", hl.dsp.window.float({ action = "toggle" }))
mbind("S", hl.dsp.layout("togglesplit"))
-- bind = $mainMod, D, exec, wpctl set-mute -p $(hyprctl activewindow -j | jq '.pid') toggle

mbind("h", hl.dsp.focus({ direction = "left" }))
mbind("l", hl.dsp.focus({ direction = "right" }))
mbind("k", hl.dsp.focus({ direction = "up" }))
mbind("j", hl.dsp.focus({ direction = "down" }))

helpers.moveTo = function(i)
	if hl.get_active_workspace().name ~= tostring(i) then
		hl.dispatch(hl.dsp.focus({ workspace = i }))
		hl.dispatch(
			hl.dsp.exec_cmd(
				"play ~/.config/hypr/extra/sfx/WORKSPACE-MOVE.wav trim 0.025 vol 0.025 pitch $((RANDOM % 150 - 100)) # Play slightly depitched noise"
			)
		)
	end
end

for i = 1, 9 do
	local key = i
	hl.bind(mainMod .. " + " .. key, function()
		helpers.moveTo(i)
	end)

	hl.bind(mainMod .. " + SHIFT + " .. key, function()
		if hl.get_active_workspace().name ~= tostring(i) then
			hl.dispatch(
				hl.dsp.exec_cmd(
					"play ~/.config/hypr/extra/sfx/WORKSPACE-MOVE.wav trim 0.025 vol 0.025 pitch $((RANDOM % 150 - 100)) # Play slightly depitched noise"
				)
			)
		end
		hl.dispatch(hl.dsp.window.move({ workspace = i }))
	end)
end

mbind("Tab", hl.dsp.window.cycle_next())
mbind("g", hl.dsp.exec_cmd("hyprctl dispatch 'send_shortcut({ '', 'SUPER + 2'})'"))

mbind("0", hl.dsp.workspace.toggle_special("scratchpad"))
mbind("SHIFT + 0", hl.dsp.window.move({ workspace = "special:scratchpad" }))

mbind("mouse:272", hl.dsp.window.drag(), { mouse = true })
mbind("mouse:273", hl.dsp.window.resize(), { mouse = true })
