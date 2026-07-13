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
					path = "/media/carlos/Personal/__Vault/__Zettelkasten",
				},
				{
					name = "Termux-tablet",
					path = "~/TarjetaSD/__Zettelkasten",
				},
			},
		},
	},
}
