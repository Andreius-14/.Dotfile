return {
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

  -- ====================================
  -- MIS CONFIGURACIONES
  -- ====================================

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      return require "nvchad.configs.mason"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
    end,
  },

  -- =================================
  -- RESALTADO DE COLORES
  -- =================================

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.nvim-treesitter",
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "configs.indent-blankline"
    end,
  },
}
