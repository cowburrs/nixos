local function run(label, cmd, type)
	type = type or "dot"
	return os.execute("gum spin --spinner " .. type .. " --title '" .. label .. "' -- " .. cmd)
end
local function gitHasUpdates(path)
	local handle = io.popen("git -C " .. path .. " rev-list HEAD..@{u} --count 2>/dev/null")
	if handle then
		local count = handle:read("*a"):gsub("%s+", "")
		handle:close()
		return tonumber(count) > 0
	end
end

local skip
for index, value in ipairs(arg) do
	if value == "-y" then
		skip = true
	end
end
skip = skip or false
local function check(filepath, name)
	if run("Fetching " .. name, "bash -c 'git -C $HOME/" .. filepath .. " fetch >/dev/null 2>&1'", "pulse") then
		local lfs = require("lfs")
		lfs.chdir(os.getenv("HOME") .. filepath)
		if gitHasUpdates("$HOME" .. filepath) then
			print(name .. " needs pull")
			if skip or os.execute("gum confirm 'do you wish to pull?'") then
				if not run("Pulling " .. name, "git pull", "pulse") then
					print("Pull Failed")
					os.exit(1)
				else
					print(name .. " Pull Success")
				end
			end
		end

		if not os.execute("git diff --quiet HEAD $HOME" .. filepath .. " >/dev/null 2>&1") then
			print(name .. " needs push")
			if not gitHasUpdates("$HOME" .. filepath) then
				if skip or os.execute("gum confirm 'Gitshit???'") then
					if not run("Shitting out a commit in " .. name, "bash -i -c 'gitshit'", "pulse") then
						print("Gitshit Failed")
						os.exit(1)
					else
						print(name .. " Gitshit Success")
					end
				end
			end
		end
	end
end
check("/nixos/", "nixos")
check("/Repositories/Taskmanger/", "taskmanger")
check("/Repositories/School/", "school")
check("/Repositories/School-Assignments/", "schoolass")
check("/logseq/", "logseq")
check("/Repositories/resources", "resources")
os.execute("notify-send 'Burrsgs Done'")
os.execute("hyprctl dispatch exec play ~/.config/hypr/extra/sfx/BURRSGS-DONE.wav vol 0.05 >/dev/null")
