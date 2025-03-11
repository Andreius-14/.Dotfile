-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = {

	-- ┏━━━━━━━━━━━━━━━━━━━━━━━┓
	-- ┃          WEB          ┃
	-- ┗━━━━━━━━━━━━━━━━━━━━━━━┛

	"html",
	"cssls",
	-- ┏━━━━━━━━━━━━━━━━━━━━━━━┓
	-- ┃        PYTHON         ┃
	-- ┗━━━━━━━━━━━━━━━━━━━━━━━┛
	-- "pyright",
	"pylsp",

	-- ┏━━━━━━━━━━━━━━━━━━━━━━━┓
	-- ┃      JAVASCRIPT       ┃
	-- ┗━━━━━━━━━━━━━━━━━━━━━━━┛
	"denols",
	-- "ts_ls",
	-- "eslint-lsp", Inservible

	-- ┏━━━━━━━━━━━━━━━━━━━━━━━┓
	-- ┃       AVANZADO        ┃
	-- ┗━━━━━━━━━━━━━━━━━━━━━━━┛

	-- C C++
	"clangd",
	-- Bash
	"bashls",
	-- Lua
	"lua_ls",

	-- ┏━━━━━━━━━━━━━━━━━━━━━━━┓
	-- ┃      COMPLEMENTO      ┃
	-- ┗━━━━━━━━━━━━━━━━━━━━━━━┛
	-- "emmet-ls",
	"custom_elements_ls",
	"jsonls",
}

local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
