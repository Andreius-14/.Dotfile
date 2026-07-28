return {
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
