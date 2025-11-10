return {
	-- ┌───────────────────────────────────┐
	-- │            Formatter              │
	-- └───────────────────────────────────┘
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" }, -- uncomment for format on save
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

	-- ┌───────────────────────────────────┐
	-- │              Mason                │
	-- └───────────────────────────────────┘
	--   [LSP - Formatter - Linter - Dap]
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"html-lsp",
				"css-lsp",
				"prettier",
				--Js
				"biome",
				"deno",
				"standardjs",
				"typescript-language-server",
				--Py
				"pylint",
				"pyright",
				"black",
				--Extra
				"bash-language-server",
				"clang-format",
				"clangd",
				"emmet-ls",
				"eslint-lsp",
				"jsonlint",
				"shellharden",
				"shfmt",
				"custom-elements-languageserver",
			},
		},
	},

	-- ┌───────────────────────────────────┐
	-- │            Colores                │
	-- └───────────────────────────────────┘

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
				"c_sharp",
				"json",
				-- low level
				"c",
				"zig",
			},
		},
	},

	-- test new blink
	-- { import = "nvchad.blink.lazyspec" },

	-- {
	--   "nvchad/ui",
	--   config = function()
	--     require "nvchad"
	--   end,
	-- },
	--
	{
		"NvChad/base46",
		branch = "v3.0",
	},
	-- {
	--   "nvchad/base46",
	--   lazy = true,
	--   build = function()
	--     require("base46").load_all_highlights()
	--   end,
	-- },
}
