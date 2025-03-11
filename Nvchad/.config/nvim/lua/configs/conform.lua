-- ┌───────────────────────────────────┐
-- │           FORMATTER               │
-- └───────────────────────────────────┘
local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		-- javascript = { "standardjs" },
		javascript = { "prettier" },
		python = { "black" },
		bash = { "shfmt" },
	},

	format_on_save = {
		async = false,
		timeout_ms = 10000,
		lsp_fallback = true,
	},
}

return options
