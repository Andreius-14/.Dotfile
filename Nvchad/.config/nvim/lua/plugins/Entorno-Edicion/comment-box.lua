return {

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                      Texto - Ascii                      │
	--          ╰─────────────────────────────────────────────────────────╯
	{
		"LudoPinelli/comment-box.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},

		opts = {}, -- Equivale a require("comment-box").setup()
		keys = {
			-- Titles (Caja centrada)
			{ "<leader><leader>cb", "<cmd>CBccbox<cr>", mode = { "n", "v" }, desc = "Comment box centered" },

			-- Named parts (Línea con texto a la izquierda)
			{ "<leader><leader>ct", "<cmd>CBllline<cr>", mode = { "n", "v" }, desc = "Comment line left text" },

			-- Simple line (Línea simple)
			{ "<leader><leader>cl", "<cmd>CBline<cr>", mode = "n", desc = "Comment simple line" },

			-- Marked comments (Caja adaptada con estilo)
			{ "<leader><leader>cm", "<cmd>CBllbox14<cr>", mode = { "n", "v" }, desc = "Comment box style 14" },
		},
	},

	-- Hacer Diagramas facil con ascii
	-- https://github.com/jbyuki/venn.nvim
}
