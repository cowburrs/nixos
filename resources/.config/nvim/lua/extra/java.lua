vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.java",
	callback = function()
		vim.schedule(function()
			local filename = vim.fn.expand("%:t:r")
			local lines = {
				"/**",
				" * " .. filename,
				" */",
				"public class " .. filename .. " {",
				"    ",
				"    public static void main(String[] args) {",
				"        ",
				"    }",
				"}",
			}
			vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
			vim.api.nvim_win_set_cursor(0, { 7, 9 }) -- inside main method
		end)
	end,
})
