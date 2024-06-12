local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "standardjs" },
    python = { "black" },
    bash = { "shfmt" },
  },

  -- These options will be passed to conform.format()
  format_on_save = {
     async = true,
    timeout_ms = 10000,
    lsp_fallback = true,
    quiet = true,
  },
}

require("conform").setup(options)
