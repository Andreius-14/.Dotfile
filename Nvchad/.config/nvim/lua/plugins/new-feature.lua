return {

	-- ═════════════════════════════════════
	--            NEW FEATURES
	-- ═════════════════════════════════════

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
	-- ═════════════════════════════════════
	--      NvChad - Features
	-- ═════════════════════════════════════
	{ "nvzone/volt", lazy = true },

	{
		"nvzone/minty",
		cmd = { "Shades", "Huefy" },
	},
	-- ═════════════════════════════════════
	--      NvChad - Extras
	-- ═════════════════════════════════════
	--
	-- {
	--   "nvchad/ui",
	--   config = function()
	--     require "nvchad"
	--   end,
	-- },
	--
	{
		"NvChad/base46",
		branch = "v3.0",
	},
	-- {
	--   "nvchad/base46",
	--   lazy = true,
	--   build = function()
	--     require("base46").load_all_highlights()
	--   end,
	-- },
	-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
	-- ┃            SOBRE-ESCRIBIR             ┃
	-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	opts = { view = { side = "right" } },
	-- },
}
