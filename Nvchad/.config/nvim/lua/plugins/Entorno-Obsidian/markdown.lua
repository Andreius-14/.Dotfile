return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-mini/mini.nvim", -- o 'nvim-tree/nvim-web-devicons'
		},
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		-- Opcional: carga solo en markdown
		ft = { "markdown" },
	},
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	ft = { "markdown" },
	-- 	build = function()
	-- 		vim.fn["mkdp#util#install"]()
	-- 	end,
	-- 	init = function()
	-- 		-- Usamos nvim_set_var para asegurar la correcta compatibilidad de la tabla Lua con Vimscript
	-- 		vim.api.nvim_set_var("mkdp_preview_options", {
	-- 			mkit = {
	-- 				breaks = true, -- Convierte los saltos de línea simples en <br> [cite: 63, 64]
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
