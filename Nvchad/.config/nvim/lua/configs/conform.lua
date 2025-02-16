local options = {
  formatters_by_ft = {
    lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		lua = { "stylua" },
		javascript = { "standardjs" },
		python = { "black" },
		bash = { "shfmt" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
