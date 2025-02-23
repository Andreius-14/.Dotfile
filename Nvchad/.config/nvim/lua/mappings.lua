require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- >>>>>>>>>>>>>> Minty  <<<<<<<<<<<<<<<<
-- map("n", "<C-a>", "<cmd>Shades <cr>")  -- Basico
map("n", "<C-a>", "<cmd>Huefy <cr>")    -- Avanzado


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
