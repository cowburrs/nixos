-- Highlight todo, notes, etc in comments
return {
    -- enabled = false,
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
}
-- PERF: ++ instead of +=.
-- HACK: Code is optimized
-- TODO: Never...
-- NOTE: Code is unreadable
-- FIX: Someone else do it please
-- WARNING: Don't do this
--
-- vim: ts=2 sts=2 sw=2 et
