return {
	-- ── smear-cursor.nvim ───────────────────────────────────────────────
	-- Efecto al mouse al moverse (https://github.com/sphamba/smear-cursor.nvim)
	-- ──────────────────────────────────────────────────────────────────────
	{
		"sphamba/smear-cursor.nvim",
		event = "VimEnter", -- ← Carga al iniciar Neovim (con o sin archivo)
		-- config = function()
		-- 	-- Activa showkeys automáticamente
		-- 	vim.cmd("ShowkeysToggle")
		-- end,
		opts = {
			stiffness = 0.5,
			trailing_stiffness = 0.49,
			never_draw_over_target = false,
		},
	},
}
