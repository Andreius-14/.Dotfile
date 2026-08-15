return {
	{ "nvzone/volt", lazy = true },

	{
		"nvzone/minty",
		cmd = { "Shades", "Huefy" },
		keys = {
			{ "m2", "<cmd>Huefy<cr>", mode = "n", desc = "Minty: Color picker avanzado (Huefy)" },
			{ "m3", "<cmd>Shades<cr>", mode = "n", desc = "Minty: Color picker básico (Shades)" },
		},
	},

	{
		"nvzone/menu",
		lazy = false,
		dependencies = { "nvzone/volt" },
		keys = {
			-- Atajo por teclado (m1)
			{
				"m1",
				function()
					require("menu").open("default")
				end,
				mode = "n",
				desc = "Abrir menú contextual predeterminado",
			},

			-- Atajo con clic derecho (<RightMouse>)
			{
				"<RightMouse>",
				function()
					require("menu.utils").delete_old_menus()

					vim.cmd.exec('"normal! \\<RightMouse>"')

					-- Detectar buffer activo bajo el puntero
					local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
					local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

					require("menu").open(options, { mouse = true })
				end,
				mode = { "n", "v" },
				desc = "Abrir menú contextual (Clic derecho)",
			},
		},
	},
}
-- ═════════════════════════════════════
--            Pluggin - Menus Color
-- ═════════════════════════════════════
-- map("n", "m2", "<cmd>Huefy <cr>") -- Avanzado
-- map("n", "m3", "<cmd>Shades <cr>") -- Basico

-- --          ╭─────────────────────────────────────────────────────────╮
-- --          │                      Pluggin Menu                       │
-- --          ╰─────────────────────────────────────────────────────────╯
--
-- -- Keyboard users
-- map("n", "m1", function()
-- 	require("menu").open("default")
-- end, {})
--
-- -- mouse users + nvimtree users!
-- map({ "n", "v" }, "<RightMouse>", function()
-- 	require("menu.utils").delete_old_menus()
--
-- 	vim.cmd.exec('"normal! \\<RightMouse>"')
--
-- 	-- clicked buf
-- 	local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
-- 	local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"
--
-- 	require("menu").open(options, { mouse = true })
-- end, {})
