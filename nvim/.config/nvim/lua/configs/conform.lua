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
    timeout_ms = 1000,
    lsp_fallback = true,
    quiet = true,
  },
}

return options
