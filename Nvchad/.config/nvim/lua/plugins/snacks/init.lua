-- En lua/plugins/snacks.lua
local group_shortcuts = { -- El "envoltorio" con submódulos
	require("plugins.snacks.picker").keys,
	require("plugins.snacks.image").keys,
	require("plugins.snacks.rename").keys,
	-- etc.
}
local shortcuts = vim.iter(group_shortcuts):flatten(1):totable()

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			-- bigfile = { enabled = true },
			-- dashboard = { enabled = true },
			-- explorer = { enabled = true },
			-- indent = { enabled = true },
			-- input = { enabled = true },
			picker = { enabled = true },
			-- notifier = { enabled = true },
			-- quickfile = { enabled = true },
			-- scope = { enabled = true },
			-- scroll = { enabled = true },
			-- statuscolumn = { enabled = true },
			words = { enabled = true },
			rename = { enabled = true }, -- Asegúrate de agregar esto si no lo tienes
			image = {
				enabled = true,
				doc = {
					inline = false,
					floating = true,
					max_width = 60,
					max_height = 30,
				},
			},
		},
		keys = shortcuts,
		config = function()
			-- --
			-- CONFIG - RENAME
			require("plugins.snacks.rename").setup()
		end,
	},
}
