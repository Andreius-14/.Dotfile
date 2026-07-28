return {
	-- ── showkeys.nvim ───────────────────────────────────────────────────
	-- Muestra las teclas Pesionadas (https://github.com/nvzone/showkeys)
	-- ──────────────────────────────────────────────────────────────────────
	{
		"nvzone/showkeys",
		event = "VimEnter", -- ← Carga al iniciar Neovim (con o sin archivo)
		config = function()
			-- Activa showkeys automáticamente
			vim.cmd("ShowkeysToggle")
		end,
		opts = {
			timeout = 1,
			maxkeys = 5,
			-- tus opciones
		},
	},
}
