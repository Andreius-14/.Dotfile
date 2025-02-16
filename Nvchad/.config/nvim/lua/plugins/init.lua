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

  -- ═════════════════════════════════════
  --              Mis
  -- ═════════════════════════════════════

  { "nvzone/volt", lazy = false },

  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     {
  --       -- snippet plugin
  --       "L3MON4D3/LuaSnip",
  --       config = function(_, opts)
  --         require("luasnip").config.set_config(opts)
  --
  --         local luasnip = require "luasnip"
  --
  --         luasnip.filetype_extend("javascriptreact", { "html" })
  --         luasnip.filetype_extend("typescriptreact", { "html" })
  --         luasnip.filetype_extend("svelte", { "html" })
  --
  --         require "nvchad.configs.luasnip"
  --       end,
  --     },
  --
  --     -- ai based completion
  --     {
  --       "jcdickinson/codeium.nvim",
  --       config = function()
  --         require("codeium").setup {}
  --       end,
  --     },
  --   },
  -- },

}
