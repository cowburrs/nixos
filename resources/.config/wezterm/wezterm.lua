-- TODO: Smearcursor commit in wezterm. i want it bad
--
-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This will hold the configuration.
local config = wezterm.config_builder()
-- local config = {}

local function truncate_to_module(abs_path) -- This function was made with ai. sorry about that
	local config_dir = wezterm.config_dir
	-- remove config_dir prefix
	local rel_path = abs_path:gsub("^" .. config_dir .. "/?", "")
	-- remove .lua extension
	rel_path = rel_path:gsub("%.lua$", "")
	-- replace / with .
	rel_path = rel_path:gsub("/", ".")
	return rel_path
end

local function list_dirs(dir)
	local files = {}
	for index, value in ipairs(wezterm.read_dir(wezterm.config_dir .. "/" .. dir)) do
		files[index] = truncate_to_module(value)
	end
	return files
end

local function combine_tables(tablelist)
	local combined = {}
	for _, t in ipairs(tablelist) do
		for _, v in ipairs(t) do
			table.insert(combined, v)
		end
	end
	return combined
end

local function dirs_to_files(dirs)
	local listed = {}
	for index, value in ipairs(dirs) do
		listed[index] = list_dirs(value)
	end
	return combine_tables(listed)
end

local directories = {
	"extra",
	"core",
}

local files = dirs_to_files(directories) -- can't fucking believe i did actual programming. yeah this is just why did i do this


-- Plugins
for _, value in ipairs(list_dirs("plugins")) do
	require(value)[1].apply_to_config(config, require(value)[2])
end

for _, k in pairs(files) do
	for index, key in pairs(require(k)) do
		config[index] = key
	end
end

return config
