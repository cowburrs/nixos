--[[ 
if you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
No teej, I will not. Thanks for helping me
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed and selected in the terminal

local function scandir(directory)
	local i, t = 0, {}
	for _, filename in ipairs(vim.fn.readdir(directory)) do
		i = i + 1
		t[i] = filename
	end
	return t
end

local function requiredir(directory)
	directory = vim.fn.expand(directory) -- expand ~
	for _, filename in ipairs(scandir(directory)) do
		if filename ~= "." and filename ~= ".." then
			-- vim.notify(filename, vim.log.levels.INFO, { title = "Test Notification" })
			dofile(directory .. "/" .. filename)
		end
	end
end

-- [[ Setting options ]]
require("core.options")

-- [[ Basic Keymaps ]]
require("core.keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
require("core.lazy-bootstrap")

-- [[ Configure and install plugins ]]
require("core.lazy-plugins")

-- [[ Source all from extra ]]
requiredir("~/.config/nvim/lua/extra")

-- for _, i in pairs(scandir("lua/extra")) do
-- 	if i ~= "." and i ~= ".." then
-- 		vim.notify(i, vim.log.levels.INFO, { title = "Test Notification" })
-- 	end
-- end

-- test notification down here to copy and paste
-- vim.notify(i, vim.log.levels.INFO, { title = "Test Notification" })
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
