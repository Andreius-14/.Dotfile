return {
	--          ╭─────────────────────────────────────────────────────────╮
	--          │                        Minisculo                        │
	--          ╰─────────────────────────────────────────────────────────╯
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
	-- {
	-- 	"romgrk/barbar.nvim",
	-- 	dependencies = {
	-- 		"nvim-tree/nvim-web-devicons", -- opcional pero recomendado
	-- 	},
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("barbar").setup() -- ¡Eso es todo!
	-- 	end,
	-- },
	--
	--          ╭─────────────────────────────────────────────────────────╮
	--          │                       Efecto Cool                       │
	--          ╰─────────────────────────────────────────────────────────╯

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

	-- ── fidget.nvim ─────────────────────────────────────────────────────
	-- Barra de carga y detalles en la esquina (https://github.com/j-hui/fidget.nvim)
	-- ──────────────────────────────────────────────────────────────────────

	-- ── nvim-notify.nvim ────────────────────────────────────────────────
	-- Muestra las notificaciones de neovim como pop (https://github.com/rcarriga/nvim-notify)
	-- psdt: Se encuentra en snack
	-- ──────────────────────────────────────────────────────────────────────

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                COmplemento EDitar Texto                 │
	--          ╰─────────────────────────────────────────────────────────╯
	-- ── nvim-surround ───────────────────────────────────────────────────
	-- Edita corchetes en paralelo (https://github.com/kylechui/nvim-surround)
	-- ──────────────────────────────────────────────────────────────────────
	{
		"kylechui/nvim-surround",
		version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		-- Optional: See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
		-- config = function()
		--     require("nvim-surround").setup({
		--         -- Put your configuration here
		--     })
		-- end
	},
}
