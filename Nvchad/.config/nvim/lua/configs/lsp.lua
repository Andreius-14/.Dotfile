require("nvchad.configs.lspconfig").defaults()

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
	"ts_ls",
	"biome",
	"vtsls",
	-- ┏━━━━━━━━━━━━━━━━━━━━━━━┓
	-- ┃        Csharp         ┃
	-- ┗━━━━━━━━━━━━━━━━━━━━━━━┛
	-- "omnisharp",
	-- "harper_ls",  -- Muy Sucio
	-- "csharp_ls",

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
	-- "custom_elements_ls",
	"jsonls",
}

vim.lsp.enable(servers)

-- local nvlsp = require("nvchad.configs.lspconfig")
-- local nvlsp = require("nvchad.configs.lspconfig").defaults()

-- nvlsp.defaults()- nvlsp.defaults()
-- read :h vim.lsp.config for changing options of lsp servers

-- for _, lsp in ipairs(servers) do
-- 	vim.lsp.config(lsp, {
-- 		on_attach = nvlsp.on_attach,
-- 		on_init = nvlsp.on_init,
-- 		capabilities = nvlsp.capabilities,
-- 	})
-- end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- ┏━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃        Csharp         ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━┛

-- lspconfig.omnisharp.setup({
-- 	on_attach = nvlsp.on_attach,
-- 	on_init = nvlsp.on_init,
-- 	cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
-- 	root_dir = function()
-- 		return require("lspconfig/util").root_pattern(
-- 			"*.sln",
-- 			"*.csproj",
-- 			"omnisharp.json",
-- 			"*.godot",
-- 			"function.json",
-- 			".git"
-- 		)(vim.fn.expand("%:p:h")) or vim.fn.expand("%:p:h")
-- 	end,
-- })
