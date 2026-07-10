return {
	-- https://github.com/hedyhli/outline.nvim

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                           Zen                           │
	--          ╰─────────────────────────────────────────────────────────╯
	-- FUerad de mantenimiento
	-- {
	-- 	"Pocco81/true-zen.nvim",
	-- 	config = function()
	-- 		require("true-zen").setup({
	-- 			-- your config goes here
	-- 			-- or just leave it empty :)
	-- 		})
	-- 	end,
	-- },
	--

	-- ╓
	-- ║ 🧘 Distraction-free coding for Neovim [https://github.com/folke/zen-mode.nvim]
	-- ╙
	-- {
	--   "folke/zen-mode.nvim",
	--   opts = {
	--     -- your configuration comes here
	--     -- or leave it empty to use the default settings
	--     -- refer to the configuration section below
	--   }
	-- },
	-- ╓
	-- ║ twilight.nvim  [https://github.com/folke/twilight.nvim]
	-- ║ 🌅 Opaca las funcion no selecccionada bajo el cursor
	-- ╙
	-- {
	--   "folke/twilight.nvim",
	--   opts = {
	--     -- your configuration comes here
	--     -- or leave it empty to use the default settings
	--     -- refer to the configuration section below
	--   }
	-- },

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
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
