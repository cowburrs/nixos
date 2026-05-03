return {
	"CRAG666/code_runner.nvim",
	config = { true, vim.keymap.set("n", "<F5>", "<cmd>RunCode<CR>i", { desc = "Run Code" }) },
}
