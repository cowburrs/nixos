local mp = require("mp")

local function show_frame_osd()
	local frame = mp.get_property("estimated-frame-number", "0")
	local total = mp.get_property("estimated-frame-count", "0")
	mp.osd_message(string.format("Frame: %s / %s", frame, total))
end

mp.add_key_binding(".", "frame_step_forward", function()
	mp.command("frame-step")
	mp.osd_message("Stepping...")
	show_frame_osd()
end)

mp.add_key_binding(",", "frame_step_backward", function()
	mp.command("frame-back-step")
	mp.osd_message("Stepping...")
	show_frame_osd()
end)
