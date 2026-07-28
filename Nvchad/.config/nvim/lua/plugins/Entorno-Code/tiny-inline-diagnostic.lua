return {
	-- ── tiny-inline-diagnostic.nvim ─────────────────────────────────────
	-- mejora grafica para errores en codigo  (https://github.com/rachartier/tiny-inline-diagnostic.nvim)
	-- ──────────────────────────────────────────────────────────────────────
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
		end,
	},
}
