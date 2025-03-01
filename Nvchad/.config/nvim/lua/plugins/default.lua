return {

	-- ═════════════════════════════════════
	--            Predeterminado
	-- ═════════════════════════════════════

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
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"html-lsp",
				"css-lsp",
				"prettier",

				--Extra
				"bash-language-server",
				"black",
				"clang-format",
				"clangd",
				"deno",
				"emmet-ls",
				"eslint-lsp",
				"jsonlint",
				"pylint",
				"pyright",
				"shellharden",
				"shfmt",
				"standardjs",
				"custom-elements-languageserver",
				"typescript-language-server",
			},
		},
	},
	{
		-- Colores a Sintaxis
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				-- defaults
				"vim",
				"lua",
				"vimdoc",
				-- web dev
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				-- Lenguajes
				"python",
				"php",
				-- low level
				"c",
				"zig",
			},
		},
	},

    {
    "mfussenegger/nvim-lint",
    dependencies = { "rshkarin/mason-nvim-lint" },
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      require "configs.linter"
    end,
  },
}
