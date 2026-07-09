--  ╭─────────────────────────────────────────────────────────╮
--  │                   Habilitar Shortcut                    │
--  ╰─────────────────────────────────────────────────────────╯
-- -- En lua/plugins/snacks.lua
-- local group_shortcuts = { -- El "envoltorio" con submódulos
-- 	require("plugins.snacks.shortcuts").keys,
-- 	require("plugins.snacks.image").keys,
-- 	require("plugins.snacks.rename").keys,
-- 	-- etc.
-- }
-- local shortcuts = vim.iter(group_shortcuts):flatten(1):totable()

--  ╭─────────────────────────────────────────────────────────╮
--  │                    Habilitar Plugin                     │
--  ╰─────────────────────────────────────────────────────────╯
return {
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		priority = 1000,
		lazy = false,
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

					enabled = true,
					inline = false,
					-- Paquete flotante
					float = true,
					max_width = 480, -- Subido de 80 a 120
					max_height = 240,
					only_render_image_at_cursor = true,
					relative = "editor",
					border = true,
					focusable = false,
					backdrop = false,
					-- row = 1,
					-- col = 1,
          row = 2,
					col = vim.o.columns - 105, -- Se adapta dinámicamente al ancho de tu pantalla
					--   					integrations = {
					-- markdown = {
					-- 	only_render_image_at_cursor = true, -- defaults to false
					-- 	only_render_image_at_cursor_mode = "popup", -- "popup" or "inline", defaults to "popup"
					-- },
					-- },
					-- width/height are automatically set by the image size unless specified below
				},
			},
		},
		-- keys = shortcuts,
		keys = require("plugins.snacks.shortcuts").keys,

		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end

					-- Override print to use snacks for `:=` command
					if vim.fn.has("nvim-0.11") == 1 then
						vim._print = function(_, ...)
							dd(...)
						end
					else
						vim.print = _G.dd
					end

					-- Create some toggle mappings
					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					Snacks.toggle.diagnostics():map("<leader>ud")
					Snacks.toggle.line_number():map("<leader>ul")
					Snacks.toggle
						.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map("<leader>uc")
					Snacks.toggle.treesitter():map("<leader>uT")
					Snacks.toggle
						.option("background", { off = "light", on = "dark", name = "Dark Background" })
						:map("<leader>ub")
					Snacks.toggle.inlay_hints():map("<leader>uh")
					Snacks.toggle.indent():map("<leader>ug")
					Snacks.toggle.dim():map("<leader>uD")
				end,
			})
		end,

		config = function(_, opts)
			-- 1. Obligatorio: Ejecutar la configuración de snacks pasando tus opts de arriba
			require("snacks").setup(opts)

			-- 2. Tu configuración personalizada para el renombrado
			require("plugins.snacks.rename").setup()
		end,
	},
}
