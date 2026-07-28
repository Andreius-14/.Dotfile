return {
	-- ── incline.nvim ────────────────────────────────────────────────────
	-- fileName sobre ventana dividida (https://github.com/b0o/incline.nvim)
	-- ────────────────────────────────────────────────────────────────────
	{
		"b0o/incline.nvim",
		config = function()
			require("incline").setup()
		end,
		-- Optional: Lazy load Incline
		event = "VeryLazy",
	},
}
