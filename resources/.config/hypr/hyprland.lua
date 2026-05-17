Terminal = "wezterm"
Menu = "rofi -config configdrun -show drun -run-command '{cmd}'"


mainMod = "SUPER" -- Sets "Windows" key as main modifier
AppBind = "SUPER + SHIFT" -- Sets "Windows" key as main modifier
helpers = {}
rules = {}
helpers.print = function (text)
	hl.notification.create({text = text, duration = 10000})
end

hl.on("hyprland.start", function()
	-- hl.exec_cmd("fcitx5")
	-- hl.exec_cmd("nm-applet")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("mako")
	hl.exec_cmd("waybar")
	hl.exec_cmd("music-discord-rpc --only-when-playing")
	hl.exec_cmd("easyeffects -w")
	hl.exec_cmd("spotify")
	hl.exec_cmd("firefox")
end)

function recursiveRequire(folder) -- NOTE: AI Generated
	local home = os.getenv("HOME")
	local abs_folder = home .. "/.config/hypr/" .. folder
	local p = io.popen('find "' .. abs_folder .. '" -name "*.lua" -type f')
	if p then
		for path in p:lines() do
			local mod = path:gsub(home .. "/.config/hypr/", ""):match("(.*)%.lua$"):gsub("/", ".")
			-- hl.exec_cmd("notify-send " .. mod)
			x = require(mod)
			table.insert(rules, x)
		end
		p:close()
	end
end
recursiveRequire("core")


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.animation({ leaf = "global", enabled = 0 })
-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
