return {
	{
		"obsidian-nvim/obsidian.nvim",

		init = function()
			require("which-key").add({
				{ "_o", group = "Obsidian", icon = "🪨" },
			})
		end,

		version = "*", -- use latest release, remove to use latest commit
		lazy = true,
		ft = "markdown",
		---@module 'obsidian'
		---@type obsidian.config
		dependencies = {
			"nvim-lua/plenary.nvim",
			"saghen/blink.cmp",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			-- Normal
			{ "_oN", "<cmd> Obsidian new_from_template<CR>", desc = "New template" },
			{ "_oi", "<cmd> Obsidian template<CR>", desc = "Inserta Template" },
			{ "_ob", "<cmd> Obsidian backlinks<CR>", desc = "Backlinks/s" },
			{ "_of", "<cmd> Obsidian follow_link<CR>", desc = "Seguir link" },
			{ "_od", "<cmd> Obsidian today <CR>", desc = "file Today" },
			{ "_oy", "<cmd> Obsidian yesterday <CR>", desc = "file Yesterday" },
			{ "_ot", "<cmd> Obsidian tomorrow <CR>", desc = "file Tomorrow" },
			{ "_oo", "<cmd> Obsidian open <CR>", desc = "Open App" },
			-- Visual
			{ "_oE", "<cmd> Obsidian extract_note <CR>", mode = "x", desc = "Extraer + New" },
		},
		opts = {
			legacy_commands = false, -- this will be removed in 4.0.0
			workspaces = {
				{
					name = "__Zettelkasten",
					path = vim.env.RUTA_VAULT,
				},
				-- {
				-- 	name = "Termux-tablet",
				-- 	path = "~/TarjetaSD/__Zettelkasten",
				-- },
			},
			-- picker = { name = "telescope.nvim" },
			daily_notes = {
				folder = "10. Dailies/",
				template = "Bitacora",
			},

			templates = {
				-- main
				folder = "Plantillas",
				-- config
				customizations = {
					-- tem.
					Bibliografica = {
						notes_subdir = "00. Medios/",
					},
					-- tem.
					Basico = {
						notes_subdir = "+",
					},
				},
			},

			-- ========== Optimizaciones para Termux / vault grande ==========
			ui = {
				enable = false, -- Desactiva iconos y resaltados visuales (recomendado)
			},

			footer = {
				enabled = false, -- Evita jobs constantes de backlinks
			},

			search = {
				max_lines = 300, -- Reduce carga al buscar (default 1000)
				-- sort_by = false, -- Descomenta si quieres aún más velocidad
			},

			cache = {
				enabled = true, -- Mejora el rendimiento de quick_switch y búsquedas
			},
		},
	},
}
