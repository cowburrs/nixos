local waywall = require("waywall")
local helpers = require("waywall.helpers")

local config = {
	theme = {
		background = "#303030ff",
	},
}

local Scene = require("waywork.scene")
local scene = Scene.SceneManager.new(waywall)

-- Register scene objects
scene:register("e_counter", {
	kind = "mirror",
	options = {
		src = { x = 1, y = 37, w = 49, h = 9 },
		dst = { x = 1150, y = 300, w = 196, h = 36 },
	},
	groups = { "thin" },
})

-- scene:register("eye_overlay", {
-- 	kind = "image",
-- 	path = "/path/to/overlay.png",
-- 	options = { dst = { x = 30, y = 340, w = 700, h = 400 } },
-- 	groups = { "tall" },
-- })
--
-- -- Enable/disable by group
-- scene:enable_group("thin", true) -- Enable all "thin" objects
-- scene:enable_group("tall", false) -- Disable all "tall" objects
--
-- -- Enable/disable individual objects
-- scene:enable("e_counter", true)

local Modes = require("waywork.modes")
local ModeManager = Modes.ModeManager.new(waywall)

ModeManager:define("thin", {
	width = 340,
	height = 1080,
	on_enter = function()
		scene:enable_group("thin", true)
	end,
	on_exit = function()
		scene:enable_group("thin", false)
	end,
})

local tall_sens = 0.1

ModeManager:define("tall", {
	width = 384,
	height = 16384,
	toggle_guard = function()
		return not waywall.get_key("F3") -- Prevent toggle during F3 debug
	end,
	on_enter = function()
		scene:enable_group("tall", true)
		waywall.set_sensitivity(tall_sens)
	end,
	on_exit = function()
		scene:enable_group("tall", false)
		waywall.set_sensitivity(0)
	end,
})

local wide_sens = 1

ModeManager:define("wide", {
	width = 16384,
	height = 384,
	toggle_guard = function()
		return not waywall.get_key("F3")
	end,
	on_enter = function()
		scene:enable_group("wide", true)
		waywall.set_sensitivity(wide_sens)
	end,
	on_exit = function()
		scene:enable_group("wide", false)
		waywall.set_sensitivity(0)
	end,
})

local Keys = require("waywork.keys")

local floating_visible = false

config.actions = Keys.actions({
	["*-F6"] = function()
		return ModeManager:toggle("wide")
	end,
	["*-Ctrl-Alt_L"] = function()
		return ModeManager:toggle("thin")
	end,
	["*-F4"] = function()
		return ModeManager:toggle("tall")
	end,
	["Ctrl-Shift-N"] = function()
		waywall.exec(programs.ninjabrain_bot)
	end,
	["Ctrl-Shift-M"] = function()
		floating_visible = not floating_visible
		waywall.show_floating(floating_visible)
	end,
})

return config
