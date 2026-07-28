return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- use latest release, remove to use latest commit
		ft = "markdown",
		---@module 'obsidian'
		---@type obsidian.config
		dependencies = {
			-- 1. La obligatoria (Manejo de procesos e hilos)
			"nvim-lua/plenary.nvim",

			-- 2. Para que el autocompletado de notas/links funcione con blink.cmp o nvim-cmp
			"saghen/blink.cmp",

			-- 3. Para búsquedas ultra rápidas de notas y enlaces dentro de Obsidian
			"nvim-telescope/telescope.nvim",

			-- 4. Para ver iconos bonitos en los menús de Obsidian
			"nvim-tree/nvim-web-devicons",
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
			templates = {
				folder = "/999-Plantillas",
				-- date_format = "%Y-%m-%d-%a",
				-- time_format = "%H:%M",
				customizations = {
					Bibliografica = {
						notes_subdir = "02-Bibliograficos/",
					},
				},
			},
		},
	},
}
