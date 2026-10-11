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
-- map({ "n", "t" }, "<F9>", function()
-- 	require("nvchad.term").runner({
--
-- 		-- Modo [01] -- Post Colega
-- 		id = "code-runner",
-- 		-- pos = "sp",
-- 		pos = "vsp",
-- 		-- pos = "float",
--
-- 		cmd = function()
-- 			-- Variables [Rutas con Emogis o ASCII]
-- 			local file = vim.fn.shellescape(vim.fn.expand("%:p"))
-- 			local file_wo_ext = vim.fn.shellescape(vim.fn.expand("%:p:r"))
--
-- 			local ft_cmds = {
--
-- 				python = "python " .. file,
-- 				cpp = "g++ -std=c++17 -O2 -DHynDuf " .. file .. " -o " .. file_wo_ext,
-- 				lua = "lua " .. file,
-- 				cs = "dotnet script " .. file,
--
-- 				javascript = "node " .. file, -- Comando para JavaScript
-- 				java = "javac " .. file .. " && java " .. file_wo_ext, -- Comando para Java
-- 			}
--
-- 			return ft_cmds[vim.bo.ft]
-- 		end,
-- 		-- clear_cmd = "",
-- 	})
-- end)

-- Función reutilizable
local function run_code()
	local mode = vim.fn.mode()
	local selection = ""
	local start_line, end_line
	local is_selection = false

	if mode == "v" or mode == "V" or mode == "\22" then -- visual, visual-line o visual-block
		-- Captura solo lo seleccionado
		is_selection = true
		start_line = vim.fn.line("v")
		end_line = vim.fn.line(".")

		if start_line > end_line then
			start_line, end_line = end_line, start_line
		end

		local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
		selection = table.concat(lines, "\n")
	else
		-- Modo normal → ejecuta todo el buffer
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
		selection = table.concat(lines, "\n")
	end

	if selection == "" then
		vim.notify("No hay código para ejecutar", vim.log.levels.WARN)
		return
	end

	local ft = vim.bo.filetype
	local cmd = ""

	if ft == "python" then
		cmd = "python3 -c " .. vim.fn.shellescape(selection)
	elseif ft == "lua" then
		cmd = "lua -e " .. vim.fn.shellescape(selection)
	elseif ft == "bash" or ft == "sh" or ft == "zsh" then
		cmd = selection
	elseif ft == "javascript" or ft == "typescript" then
		cmd = "node -e " .. vim.fn.shellescape(selection)
	elseif ft == "cpp" then
		-- === C / C++ ===
		local file = vim.fn.expand("%:p")
		local file_wo_ext = vim.fn.expand("%:p:r")
		local exe = file_wo_ext

		if is_selection then
			-- Selección → archivo temporal
			local tmp = vim.fn.tempname() .. ".cpp"
			vim.fn.writefile(vim.split(selection, "\n"), tmp)
			exe = vim.fn.tempname() -- binario temporal

			cmd = string.format(
				"g++ -std=c++17 -O2 -Wall -DHynDuf %s -o %s && %s",
				vim.fn.shellescape(tmp),
				vim.fn.shellescape(exe),
				vim.fn.shellescape(exe)
			)
		else
			-- Archivo completo
			cmd = string.format(
				"g++ -std=c++17 -O2 -Wall -DHynDuf %s -o %s && %s",
				vim.fn.shellescape(file),
				vim.fn.shellescape(exe),
				vim.fn.shellescape(exe)
			)
		end
	else
		vim.notify("Ejecución no configurada para: " .. ft, vim.log.levels.WARN)
		return
	end

	require("nvchad.term").runner({
		id = "code-runner",
		pos = "vsp",
		cmd = cmd,
	})
end

-- Mapeos
vim.keymap.set("n", "<F9>", run_code, { desc = "Ejecutar todo el archivo" })
vim.keymap.set("v", "<F9>", run_code, { desc = "Ejecutar selección" })

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
-- vim.keymap.set("n", "<leader>ih", function()
-- 	Snacks.image.hover()
-- end, { desc = "Image Hover (Snacks)" })
--
-- vim.keymap.set("n", "<leader>it", function()
-- 	-- Accedemos al módulo de imágenes de snacks de forma segura
-- 	local img = require("snacks.image")
--
-- 	-- Alternamos el estado de renderizado inline actual
-- 	img.config.doc.inline = not img.config.doc.inline
--
-- 	-- Notificación visual del estado actual (sintaxis correcta en Lua con and / or)
-- 	local status = img.config.doc.inline and "Activado (Todas visibles)" or "Desactivado (Solo hover)"
-- 	vim.notify("Images: " .. status, vim.log.levels.INFO)
-- end, { desc = "Toggle inline images" })
