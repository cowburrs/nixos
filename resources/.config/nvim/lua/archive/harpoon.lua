return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", "", { desc = "H[A]rpoon" })
		vim.keymap.set("n", "<leader>aa", function()
			harpoon:list():add()
		end, { desc = "H[A]rpoon [A]dd" })
		vim.keymap.set("n", "<leader>ae", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "H[A]rpoon [E]dit/See list" })
	end,
}
