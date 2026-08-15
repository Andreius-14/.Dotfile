require("nvchad.mappings")

local map = vim.keymap.set

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

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

--          ╭─────────────────────────────────────────────────────────╮
--          │                    Render Markdown                      │
--          ╰─────────────────────────────────────────────────────────╯
map("n", "<leader>tm", "<cmd>RenderMarkdown toggle<cr>", { desc = "Markdown: Toggle preview" })

--          ╭─────────────────────────────────────────────────────────╮
--          │                         unicode                         │
--          ╰─────────────────────────────────────────────────────────╯

-- Raíces (Inicio de bloque)
keymap("n", "-1", "I╭─○ <Esc>", opts)
keymap("n", "_1", "I╭─◍ <Esc>", opts)

-- Nodos Medios (Cuerpo del árbol)
keymap("n", "-2", "I├─○ <Esc>", opts)
keymap("n", "_2", "I├─◍ <Esc>", opts)

-- Nodos Finales (Cierre de bloque)
keymap("n", "-3", "I╰─○ <Esc>", opts)
keymap("n", "_3", "I╰─◍ <Esc>", opts)

--          ╭─────────────────────────────────────────────────────────╮
--          │                       Plantillas                        │
--          ╰─────────────────────────────────────────────────────────╯

keymap("n", "__1", "o" .. [[
○
├─○ 
├─○ 
╰─○]] .. "<Esc>")

keymap("n", "__2", "o" .. [[
╭─○
├─○
├─○
╰─○]] .. "<Esc>")

keymap("n", "__11", "o" .. [[
◍ punto
├─◍ 
├─◍ 
╰─◍]] .. "<Esc>")

keymap("n", "__22", "o" .. [[
╭─◍
├─◍
├─◍
╰─◍]] .. "<Esc>")

-- Hover de imagen con Snacks (funciona en cualquier filetype)
vim.keymap.set("n", "<leader>ih", function()
	Snacks.image.hover()
end, { desc = "Image Hover (Snacks)" })
