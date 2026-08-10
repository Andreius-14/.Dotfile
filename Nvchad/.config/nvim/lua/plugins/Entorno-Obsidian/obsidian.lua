return {
	{
		"obsidian-nvim/obsidian.nvim",

		init = function()
			require("which-key").add({
				{ "_o", group = "Obsidian", icon = "🪨" },
			})
		end,

		version = "*", -- use latest release, remove to use latest commit
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
			{ "_oN", "<cmd> Obsidian new_from_template<CR>", desc = "New template" },
			{ "_oi", "<cmd> Obsidian template<CR>", desc = "Inserta Template" },
			{ "_ob", "<cmd> Obsidian backlinks<CR>", desc = "Backlinks/s" },
			{ "_of", "<cmd> Obsidian follow_link<CR>", desc = "Seguir link" },
			{ "_oE", "<cmd> Obsidian extract_note <CR>", mode = "x", desc = "Extraer + New" },
      { "_od", "<cmd> Obsidian today <CR>", desc="file Today"},
      { "_oy", "<cmd> Obsidian yesterday <CR>", desc="file Yesterday"},
      { "_ot", "<cmd> Obsidian tomorrow <CR>", desc="file Tomorrow"}
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
			daily_notes = {
				folder = "Dailies",
				template = "Bitacora",
			},

			templates = {
				folder = "Plantillas",
				customizations = {
					Bibliografica = {
						notes_subdir = "02 Notas Permanentes/",
					},
			    Basico = {
              notes_subdir = "01 Notas Rapidaz",
          }	
      },

			},
		},
	},
}
