return {
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

	{
		"LudoPinelli/comment-box.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("comment-box").setup()
			-- Solo agregar keybindings
			-- vim.keymap.set(
			-- 	{ "n", "v" },
			-- 	"<leader>bb",
			-- 	"<cmd>lua require('comment-box').accbox()<cr>",
			-- 	{ desc = "Comment box centered" }
			-- )
			-- vim.keymap.set(
			-- 	{ "n", "v" },
			-- 	"<leader>bc",
			-- 	"<cmd>lua require('comment-box').ccbox()<cr>",
			-- 	{ desc = "Comment box left" }
			-- )
			-- vim.keymap.set(
			-- 	{ "n", "v" },
			-- 	"<leader>bl",
			-- 	"<cmd>lua require('comment-box').lbox()<cr>",
			-- 	{ desc = "Left comment" }
			-- )
			-- vim.keymap.set(
			-- 	{ "n", "v" },
			-- 	"<leader>br",
			-- 	"<cmd>lua require('comment-box').rbox()<cr>",
			-- 	{ desc = "Right comment" }
			-- )
		end,
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
}
