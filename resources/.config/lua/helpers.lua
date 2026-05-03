local function dump(o)
	if type(o) == "table" then
		local keys = {}
		for k in pairs(o) do
			table.insert(keys, k)
		end
		table.sort(keys, function(a, b)
			if type(a) == type(b) then
				return a < b
			end
			return tostring(a) < tostring(b)
		end)
		local s = "{"
		for _, k in ipairs(keys) do
			local v = o[k]
			local fk = type(k) ~= "number" and '"' .. k .. '"' or k
			s = s .. "" .. fk .. " = " .. dump(v) .. ", "
		end
		return s .. "} "
	else
		return tonumber(o) and tostring(o) or '"' .. tostring(o) .. '"'
	end
end
return { dump = dump }
