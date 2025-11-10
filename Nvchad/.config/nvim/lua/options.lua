require "nvchad.options" 


-- ═════════════════════════════════════
--            NEW FEATURES
-- ═════════════════════════════════════


local o = vim.o

-- ┌───────────────────────────────────┐
-- │           Línea del cursor        │
-- └───────────────────────────────────┘
o.cursorline = true
o.cursorlineopt = "both"

-- ┌───────────────────────────────────┐
-- │              Toggle               │
-- └───────────────────────────────────┘
o.foldmethod = "indent" -- Método de plegado (indentación)
o.foldlevelstart = 99 -- Nivel de plegado inicial (abierto por defecto)

o.wrap = false

-- ┌───────────────────────────────────┐
-- │             Indentación           │
-- └───────────────────────────────────┘
-- o.tabstop = 4            -- Un TAB se ve como 4 espacios
o.expandtab = true -- Inserta espacios en lugar de TAB
o.softtabstop = 4 -- Espacios insertados en lugar de TAB
o.shiftwidth = 4 -- Tamaño de la indentación automática
o.smartindent = true -- Indentación inteligente
o.autoindent = true -- Mantiene la indentación al crear nuevas líneas

-- ┌───────────────────────────────────┐
-- │              Búsqueda             │
-- └───────────────────────────────────┘
-- o.hlsearch = true        -- Resalta los resultados de búsqueda
o.ignorecase = true -- Ignora mayúsculas/minúsculas al buscar
o.smartcase = true -- Búsqueda sensible a mayúsculas si la consulta las incluye

-- o.guifont = "JetBrainsMono Nerd Font:h14"  -- Cambia el tamaño según lo que prefiera
-- o.guifont = "JetbrainsMono Nerd Font:h9"
