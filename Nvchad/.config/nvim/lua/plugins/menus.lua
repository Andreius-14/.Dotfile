return {
	{ "nvzone/volt", lazy = true },

	{
		"nvzone/minty",
		cmd = { "Shades", "Huefy" },
	},
	{
		"nvzone/menu",
		lazy = false, -- Carga el plugin al iniciar Neovim
		dependencies = { "nvzone/volt" }, -- Dependencia requerida
		config = function()
    end,
	},
}
