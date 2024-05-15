local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "standardjs" },
    python = { "black" },
    bash = { "shfmt" },
  },
  format_on_save = {
    async = true,
    lsp_fallback = false,
    quiet = true,
    timeout_ms = 10500,
  },
  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 5500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
