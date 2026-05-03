-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
-- TODO: Actually do that. look through the option-list. you got it 
-- Also you need to make local opts, and remove the redundant vim.o its literally bloat. DRY after all

vim.o.number = true -- Make line numbers default
vim.o.relativenumber = true
vim.o.signcolumn = "number"

-- kinda unsafe idk but i like it
vim.o.exrc = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.o.relativenumber = true

-- Fold methods, can you imagine I might have never found these out?
vim.o.foldmethod = "indent"
vim.o.foldlevel = 0
vim.o.foldlevelstart = 99

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Colour Column
-- vim.o.colorcolumn = "72" -- NEVERMIND ITS SO UGLY WTFFFF

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.inccommand = "split" -- Preview substitutions live, as you type!

vim.o.cursorline = true -- Show which line your cursor is on

vim.o.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.

vim.o.wrap = false

-- See `:help 'confirm'`
vim.o.confirm = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
-- vim.opt_local.expandtab = true
-- vim.o.autochdir = true
-- vim: ts=2 sts=2 sw=2 et
