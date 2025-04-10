-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "horizon",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },

	-- ═════════════════════════════════════
	--                Mis
	-- ═════════════════════════════════════
	-- transparency = true,
}

-- M.nvimtree = {
-- 	view = {
-- 		side = "right", -- Mueve el árbol a la derecha
-- 	},
-- }
-- M.nvdash = {
-- 	header = {
-- 		"           ▄ ▄                   ",
-- 		"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
-- 		"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
-- 		"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
-- 		"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
-- 		"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
-- 		"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
-- 		"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
-- 		"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
-- 		"                                 ",
-- 	},
-- }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
