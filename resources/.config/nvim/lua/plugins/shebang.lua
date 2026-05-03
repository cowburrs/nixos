return {
	"susensio/magic-bang.nvim",
	config = {
		true,
		-- Keymap for shebang
		vim.keymap.set("n", "<leader>S", "<cmd>Bang<CR>", { desc = "[S]hebang Current Buffer" }),
	},
	-- event = "BufNewFile",
	cmd = "Bang",
}
