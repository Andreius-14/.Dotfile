-- ┌───────────────────────────────────┐
-- │           FORMATTER               │
-- └───────────────────────────────────┘
local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "standardjs" },
		-- javascript = { "prettier" },
		python = { "black" },
		bash = { "shfmt" },
	},

	format_on_save = {
		timeout_ms = 5000, -- Aumenta el tiempo de espera a 3000 ms (3 segundos)
		lsp_fallback = true,
	},
}

return options
