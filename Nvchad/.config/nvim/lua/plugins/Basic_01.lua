return {

	-- ═════════════════════════════════════
	--            Formatter
	-- ═════════════════════════════════════
	{
		"stevearc/conform.nvim",
		event = 'BufWritePre', -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- ═════════════════════════════════════
	--            LSP
	-- ═════════════════════════════════════
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},


	-- ═════════════════════════════════════
	--            Linter
	-- ═════════════════════════════════════
	-- {
	-- 	"mfussenegger/nvim-lint",
	-- 	dependencies = { "rshkarin/mason-nvim-lint" },
	-- 	event = { "BufReadPost", "BufNewFile" },
	-- 	config = function()
	-- 		require("configs.linter")
	-- 	end,
	-- },
	-- ═════════════════════════════════════
	--  Gestor [LSP - Formatter - Linter - Dap]
	-- ═════════════════════════════════════
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

	-- ═════════════════════════════════════
	--            NEW FEATURES
	-- ═════════════════════════════════════

    -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
