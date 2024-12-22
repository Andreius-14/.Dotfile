-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "github_dark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

-- M.mason = {
-- 	pkgs = {
-- 		"lua-language-server",
-- 		"stylua",
-- 		"html-lsp",
-- 		"css-lsp",
-- 		"prettier",
--
-- 		--Extra
-- 		"bash-language-server",
-- 		"black",
-- 		"clang-format",
-- 		"clangd",
-- 		"deno",
-- 		"emmet-ls",
-- 		"eslint-lsp",
-- 		"jsonlint",
-- 		"pylint",
-- 		"pyright",
-- 		"shellharden",
-- 		"shfmt",
-- 		"standardjs",
-- 		"custom-elements-languageserver",
-- 		"typescript-language-server",
-- 	},
-- }

return M
