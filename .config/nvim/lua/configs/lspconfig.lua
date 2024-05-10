
-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers =
  { "html", "cssls","denols", "eslint", "tsserver", "clangd", "pyright", "custom_elements_ls", "emmet_ls" , "bashls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }

lspconfig.denols.setup{
   on_attach = on_attach,
   capabilities = capabilities,

}
lspconfig.typst_lsp.setup{
   on_attach = on_attach,
   capabilities = capabilities,
}

lspconfig.pyright.setup{
   on_attach = on_attach,
   capabilities = capabilities,
}

lspconfig.custom_elements_ls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.emmet_ls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.eslint.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

--Bash
lspconfig.bashls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

