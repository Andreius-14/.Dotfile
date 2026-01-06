-- ┏━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃     Conform.nvim      ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━┛
local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		-- javascript = { "prettier" },
		-- javascript = { "standardjs" }, -- ← CORREGIDO
		-- javascript = { "biome" },
		-- javascriptreact = { "standardjs" },
		-- typescript = { "standardjs" },
		-- typescriptreact = { "standardjs" },
		python = { "black" },
		bash = { "shfmt" },
	},

	formatters = {
		standardjs = {
			command = "standard",
			args = { "--fix", "--stdin", "$FILENAME" },
			stdin = true,
			timeout_ms = 20000,
		},
	},
	-- Optional: Configure format-on-save
	format_on_save = {
		timeout_ms = 20000,
		lsp_format = "fallback",
	},

	-- Optional: Notify on errors
	notify_on_error = true,
}

return options
