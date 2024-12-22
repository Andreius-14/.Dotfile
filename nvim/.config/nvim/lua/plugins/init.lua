return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	-- ====================================
	-- MIS CONFIGURACIONES
	-- ====================================

	{
		"neovim/nvim-lspconfig",
		event = "User FilePost",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
		end,
	},

	-- =================================
	-- RESALTADO DE COLORES
	-- =================================

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("configs._nvim-treesitter")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("configs._indent-blankline")
		end,
	},
}
