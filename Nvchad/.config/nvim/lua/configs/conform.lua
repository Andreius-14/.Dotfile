local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "prettier" },
		-- javascript = { "standardjs" },
		-- javascriptreact = { "standardjs" },
		-- typescript = { "standardjs" },
		-- typescriptreact = { "standardjs" },
		python = { "black" },
		bash = { "shfmt" },
	},

	-- formatters = {
	-- 	standardjs = {
	-- 		command = "standard",
	-- 		args = { "--fix", "$FILENAME" },
	-- 		stdin = false,
	-- 		timeout_ms = 5000, -- opcional, aumenta tiempo de espera
	-- 	},
	-- },
}

return options
