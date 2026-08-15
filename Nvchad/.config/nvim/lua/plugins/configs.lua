return {
	-- ┌───────────────────────────────────┐
	-- │            Formatter              │
	-- └───────────────────────────────────┘
	{
		   "stevearc/conform.nvim",
		-- event = { "BufWritePre" }, -- uncomment for format on save
		cmd = { "ConformInfo" },
		opts = require("configs.formatter"),
	},

	-- ┌───────────────────────────────────┐
	-- │                LSP                │
	-- └───────────────────────────────────┘
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lsp")
		end,
	},

	-- ┌───────────────────────────────────┐
	-- │              Linter               │
	-- └───────────────────────────────────┘
	{
		"mfussenegger/nvim-lint",
		dependencies = { "rshkarin/mason-nvim-lint" },
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("configs.linter")
		end,
	},


}
