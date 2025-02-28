require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- >>>>>>>>>>>>>> Minty  <<<<<<<<<<<<<<<<
-- map("n", "<C-a>", "<cmd>Shades <cr>")  -- Basico
map("n", "<C-a>", "<cmd>Huefy <cr>") -- Avanzado

-- >>>>>>>>>>>>>> Code-Runner  <<<<<<<<<<<<<<<<
vim.keymap.set({ "n", "t" }, "<F9>", function()
	require("nvchad.term").runner({

		-- Modo [01] -- Post Colega
		id = "code-runner",
		pos = "sp",
		-- pos = "float",

		cmd = function()
			-- Variables [Rutas con Emogis o ASCII]
			local file = vim.fn.shellescape(vim.fn.expand("%:p"))
			local file_wo_ext = vim.fn.shellescape(vim.fn.expand("%:p:r"))

			local ft_cmds = {

				python = "python " .. file,
				cpp = "g++ -std=c++17 -O2 -DHynDuf " .. file .. " -o " .. file_wo_ext,
				lua = "lua " .. file,

				javascript = "node " .. file, -- Comando para JavaScript
				java = "javac " .. file .. " && java " .. file_wo_ext, -- Comando para Java
			}

			return ft_cmds[vim.bo.ft]
		end,
		-- clear_cmd = "",
	})
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
