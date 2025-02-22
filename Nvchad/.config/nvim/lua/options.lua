require "nvchad.options"

-- ═════════════════════════════════════
--                Mis
-- ═════════════════════════════════════

local o = vim.o

o.cursorline = true
o.cursorlineopt = "both"

o.foldmethod = "indent" --Habilita Toggle
o.foldlevelstart = 99 -- Toggle Open Default

o.wrap = false

o.tabstop = 4 -- A TAB character looks like 4 spaces
o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- o.guifont = "Times New Romans"
-- o.foldmethod = "syntax"

-- ===========================
-- Texto
-- ===========================
-- o.ignorecase = true

-- o.guifont = "JetbrainsMono Nerd Font:h10"
