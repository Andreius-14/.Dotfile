-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  -- Complemento
  "emmet_ls",
  "custom_elements_ls",
  "jsonls",
  -- Desarrollo Web
  "html",
  "cssls",
  -- Python
  "pyright",
  -- Js
  "denols",
  "eslint",
  "tsserver",
  -- C C++
  "clangd",
  -- Bash
  "bashls",
  -- Lua
  "lua_ls",
}

-- Instalado Manualmente
-- yay -S vscode-langservers-extracted

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }

-- lspconfig.denols.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
-- lspconfig.typst_lsp.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- lspconfig.custom_elements_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- lspconfig.emmet_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- lspconfig.eslint.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

--Bash
-- lspconfig.bashls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
