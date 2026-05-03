return {
	"michaelb/sniprun",
	branch = "master",

	build = "sh install.sh",

	keys = {
		{
			"<leader>r",
			"",
			desc = "Snip[R]un",
			mode = { "v", "n" },
		},
		{
			"<leader>rr",
			"<CMD>SnipRun<CR>",
			desc = "Snip[R]un [R]un",
			mode = { "n" },
		},
		{
			"<leader>rc",
			"<CMD>SnipClose<CR>",
			desc = "Snip[R]un [C]lose",
			mode = { "n" },
		},
		{
			"<leader>re",
			"<CMD>SnipReset<CR>",
			desc = "Snip[R]un R[E]set",
			mode = { "n" },
		},
		{
			"<leader>rc",
			"<CMD>SnipClose<CR>",
			desc = "Snip[R]un [C]lose",
			mode = { "n" },
		},
		{
			"<leader>ra",
			"ggvG:SnipRun<CR>",
			desc = "Snip[R]un [A]ll (Jank)",
			mode = { "n" },
		},
		{
			"<leader>ro",
			"vgg:SnipRun<CR>'>",
			desc = "Snip[R]un Ab[O]ve (Jank)",
			mode = { "n" },
		},
		{
			"<leader>rr",
			-- "<CMD>'<,'>SnipRun<CR>",
			":SnipRun<CR>",
			desc = "Snip[R]un [R]un",
			mode = { "v" },
		},
	},
}
