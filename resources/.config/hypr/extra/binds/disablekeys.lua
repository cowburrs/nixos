hl.bind("SUPER + SHIFT + q", hl.dsp.submap("disable"))
hl.define_submap("disable", function()
	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind("catchall", function()
		-- hl.dispatch(hl.dsp.no_op())
		-- if hl.get_active_window().class == "firefox" then -- NOTE: This doesnt work cause pass doesnt work correctly i dont think?
		-- 	helpers.print(hl.get_active_window().title)
		-- 	hl.dispatch(hl.dsp.pass({ "title:" .. hl.get_active_window().title }))
		-- else
		-- 	helpers.print("Nope")
		-- end
	end, { ignore_mods = true })
end)
