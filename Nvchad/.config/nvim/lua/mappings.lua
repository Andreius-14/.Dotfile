require("nvchad.mappings")

local map = vim.keymap.set

-- ═════════════════════════════════════
--            Sintaxis
-- ═════════════════════════════════════
--
-- map("<modo>","<shortcute>", "run code")
--
-- [Example]
-- vim.keymap.set("i", "jk", "<Esc>")  -- salir del modo inserción con jk
-- vim.keymap.set({"n", "v"}, "<C-s>", ":w<CR>")  -- guardar en normal y visual

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--          ╭─────────────────────────────────────────────────────────╮
--          │                       Code Runner                       │
--          ╰─────────────────────────────────────────────────────────╯
map({ "n", "t" }, "<F9>", function()
	require("nvchad.term").runner({

		-- Modo [01] -- Post Colega
		id = "code-runner",
		-- pos = "sp",
		pos = "vsp",
		-- pos = "float",

		cmd = function()
			-- Variables [Rutas con Emogis o ASCII]
			local file = vim.fn.shellescape(vim.fn.expand("%:p"))
			local file_wo_ext = vim.fn.shellescape(vim.fn.expand("%:p:r"))

			local ft_cmds = {

				python = "python " .. file,
				cpp = "g++ -std=c++17 -O2 -DHynDuf " .. file .. " -o " .. file_wo_ext,
				lua = "lua " .. file,
				cs = "dotnet script " .. file,

				javascript = "node " .. file, -- Comando para JavaScript
				java = "javac " .. file .. " && java " .. file_wo_ext, -- Comando para Java
			}

			return ft_cmds[vim.bo.ft]
		end,
		-- clear_cmd = "",
	})
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- ═════════════════════════════════════
--            Pluggin - Menus Color
-- ═════════════════════════════════════
map("n", "m2", "<cmd>Huefy <cr>") -- Avanzado
map("n", "m3", "<cmd>Shades <cr>") -- Basico

--          ╭─────────────────────────────────────────────────────────╮
--          │                      Pluggin Menu                       │
--          ╰─────────────────────────────────────────────────────────╯

-- Keyboard users
map("n", "m1", function()
	require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
map({ "n", "v" }, "<RightMouse>", function()
	require("menu.utils").delete_old_menus()

	vim.cmd.exec('"normal! \\<RightMouse>"')

	-- clicked buf
	local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
	local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

	require("menu").open(options, { mouse = true })
end, {})

-- ═════════════════════════════════════
-- AÑADE WHICH-KEY AL FINAL
-- ═════════════════════════════════════

-- local wk = require "which-key"
-- wk.register({
--   -- Define el grupo del submenú
--   { "<Leader>c", group = " □ Boxes" },
--
--   -- Define los mapeos dentro de ese grupo
--   { "<Leader>cb", "<Cmd>CBccbox<CR>", desc = "Box Title" },
--   { "<Leader>ct", "<Cmd>CBllline<CR>", desc = "Titled Line" },
--   { "<Leader>cl", "<Cmd>CBline<CR>", desc = "Simple Line" },
--   { "<Leader>cm", "<Cmd>CBllbox14<CR>", desc = "Marked" },
--
--   -- NOTA: El argumento final indica el modo y el prefijo
-- }, { mode = { "n", "v" } }) -- Aplica en modo Normal y Visual
--

--          ╭─────────────────────────────────────────────────────────╮
--          │                         Comment                         │
--          ╰─────────────────────────────────────────────────────────╯

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Titles
keymap({ "n", "v" }, "<Leader><Leader>cb", "<Cmd>CBccbox<CR>", opts)
-- Named parts
keymap({ "n", "v" }, "<Leader><Leader>ct", "<Cmd>CBllline<CR>", opts)
-- Simple line
keymap("n", "<Leader><Leader>cl", "<Cmd>CBline<CR>", opts)
-- keymap("i", "<M-l>", "<Cmd>CBline<CR>", opts) -- To use in Insert Mode
-- Marked comments
keymap({ "n", "v" }, "<Leader><Leader>cm", "<Cmd>CBllbox14<CR>", opts)
-- Removing a box is simple enough with the command (CBd), but if you
-- use it a lot:
-- keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", opts)
