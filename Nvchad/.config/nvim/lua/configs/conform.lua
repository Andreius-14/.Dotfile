-- ┌───────────────────────────────────┐
-- │           FORMATTER               │
-- └───────────────────────────────────┘
local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		-- javascript = { "standard_custom" },
		javascript = { "prettier" },
		python = { "black" },
		bash = { "shfmt" },
		cs = { "csharpier" },
	},

	format_on_save = {
		timeout_ms = 20000,
		lsp_fallback = true,
	},

	-- ┌───────────────────────────────────┐
	-- │    FORMATTER PERSONALIZADO        │
	-- └───────────────────────────────────┘
	formatters = {
		standard_custom = {
			-- Comando para ejecutar standard con --fix
			command = "standard",
			args = { "--fix", "$FILENAME" }, -- "$FILENAME" es el archivo actual
			stdin = false, -- No usar stdin (standard necesita el archivo directamente)
		},
	},
}

return options
