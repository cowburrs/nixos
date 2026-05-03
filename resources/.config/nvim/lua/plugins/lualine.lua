return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = {
					"mode",
				},
				lualine_b = {
					"branch",
					"diff",
					{
						"macro-recording",
						fmt = function()
							local recording_register = vim.fn.reg_recording()
							if recording_register == "" then
								return ""
							else
								return "Recording @" .. recording_register
							end
						end,
					},
					"diagnostics",
				},
				lualine_c = { { "filename", path = 3 } },
				lualine_x = { "lsp_status", "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 3 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}

-- Available components
--
--     branch (git branch)
--     buffers (shows currently available buffers)
--     diagnostics (diagnostics count from your preferred source)
--     diff (git diff status)
--     encoding (file encoding)
--     fileformat (file format)
--     filename
--     filesize
--     filetype
--     hostname
--     location (location in file in line:column format)
--     mode (vim mode)
--     progress (%progress in file)
--     searchcount (number of search matches when hlsearch is active)
--     selectioncount (number of selected characters or lines)
--     tabs (shows currently available tabs)
--     windows (shows currently available windows)
--     lsp_status (shows active LSPs in the current buffer and a progress spinner)
