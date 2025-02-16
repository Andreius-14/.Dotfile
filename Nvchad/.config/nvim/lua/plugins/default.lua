return {

  -- ═════════════════════════════════════
  --            Predeterminado
  -- ═════════════════════════════════════

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "vimdoc",
        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        -- Lenguajes
        "python",
        "php",
        -- low level
        "c",
        "zig",
      },
    },
  },

}
