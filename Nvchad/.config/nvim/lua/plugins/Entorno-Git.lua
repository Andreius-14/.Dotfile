return {
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("diffview").setup({})
		end,
	},

	-- ── lazygit.nvim ────────────────────────────────────────────────────
	-- git en paneles (https://github.com/kdheepak/lazygit.nvim)
	-- ──────────────────────────────────────────────────────────────────────

	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	-- ╓
	-- ║ codediff.nvim (https://github.com/esmuellert/codediff.nvim)
	-- ║ A Neovim plugin that provides VSCode-style diff
	-- ║ rendering with two-tier highlighting (line + character
	-- ║ level) in side-by-side and inline layouts, using
	-- ║ VSCode's algorithm implemented in C.
	-- ╙
}
