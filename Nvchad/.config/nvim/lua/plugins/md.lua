return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			image = {
				enable = true,
			},
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		init = function()
			-- Usamos nvim_set_var para asegurar la correcta compatibilidad de la tabla Lua con Vimscript
			vim.api.nvim_set_var("mkdp_preview_options", {
				mkit = {
					breaks = true, -- Convierte los saltos de línea simples en <br> [cite: 63, 64]
				},
			})
		end,
	},

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
						notes_subdir = "002-Bibliograficos/",
					},
				},
			},
		},
	},
	{
		"marcocofano/excalidraw.nvim",
		version = "*", -- Usa la última versión estable
		dependencies = {
			"nvim-telescope/telescope.nvim", -- Requerido para los selectores de archivos/plantillas
		},
		config = function()
			require("excalidraw").setup({
				-- Directorio global donde se guardarán tus dibujos de Excalidraw
				storage_dir = vim.env.RUTA_EXCALIDRAW,

				-- Directorio para tus plantillas personalizadas
				templates_dir = "~/.excalidraw/templates",

				-- Abre la PWA de Excalidraw inmediatamente al crear un archivo nuevo
				open_on_create = true,

				-- Usa rutas relativas al insertar enlaces en tus notas Markdown
				relative_path = true,

				-- Mapeos de teclado dentro de los menús flotantes (pickers)
				picker = {
					link_scene_mapping = "<C-l>", -- Atajo para enlazar una escena seleccionada
				},
			})
		end,
	},
}
