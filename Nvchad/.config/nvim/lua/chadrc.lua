-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "chadracula-evondev",

	-- changed_themes = {
	-- 	oxocarbon = {
	-- 		base_16 = {
	-- 			base00 = "#000000",
	-- 		},
	-- 	},
	-- },
	-- transparency = true,
	hl_override = {
		-- CursorLine = { bg = "black" },
		-- CursorLineNr = { bg = "black" },
		-- Normal = { bg = "#060606" },
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
	-- hl_override = {
	-- Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
	-- ═════════════════════════════════════
	--                Mis
	-- ═════════════════════════════════════
}

-- M.nvimtree = {
-- 	view = {
-- 		side = "right", -- Mueve el árbol a la derecha
-- 	},
-- }

M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }
M.ui = {
	telescope = {
		style = "bordered",
	},
}
return M
