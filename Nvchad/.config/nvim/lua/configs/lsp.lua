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
	-- "biome",
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
	"emmet_language_server",
	"emmet-ls",
	-- "custom_elements_ls",
	"jsonls",
}

vim.lsp.enable(servers)

-- local nvlsp = require("nvchad.configs.lspconfig").defaults()

-- ┏━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃      EMMET LSP        ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━┛
--
-- local lspconfig = require("lspconfig")
-- local configs = require("lspconfig/configs")
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- lspconfig.emmet_ls.setup({
-- 	-- on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = {
-- 		"css",
-- 		"eruby",
-- 		"html",
-- 		"javascript",
-- 		"javascriptreact",
-- 		"less",
-- 		"sass",
-- 		"scss",
-- 		"svelte",
-- 		"pug",
-- 		"typescriptreact",
-- 		"vue",
-- 	},
-- 	init_options = {
-- 		html = {
-- 			options = {
-- 				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
-- 				["bem.enabled"] = true,
-- 			},
-- 		},
-- 	},
-- })

-- vim.lsp.config("emmet_language_server", {
-- 	cmd = { "emmet-language-server", "--stdio" },
-- 	filetypes = {
-- 		"html",
-- 		"css",
-- 		"javascriptreact",
-- 		"typescriptreact",
-- 		"svelte",
-- 		"vue",
-- 		"astro",
-- 		"xml",
-- 		"php",
-- 	},
-- 	root_dir = function()
-- 		return vim.loop.cwd()
-- 	end,
-- })

-- local nvlsp = require("nvchad.configs.lspconfig")

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
