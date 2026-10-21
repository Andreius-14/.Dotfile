require "nvchad.options" 


-- ═════════════════════════════════════
--            NEW FEATURES
-- ═════════════════════════════════════


local o = vim.o
vim.opt.conceallevel = 2
-- ┌───────────────────────────────────┐
-- │           Línea del cursor        │
-- └───────────────────────────────────┘
o.cursorline = true
o.cursorlineopt = "both"

-- ┌───────────────────────────────────┐
-- │              Toggle               │
-- └───────────────────────────────────┘
-- o.foldmethod = "indent" -- Método de plegado (indentación)

o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldenable = true

o.foldlevelstart = 99 -- Nivel de plegado inicial (abierto por defecto)

o.wrap = false

-- vim.api.nvim_create_autocmd('FileType', {
--     group = vim.api.nvim_create_augroup('markdown.fold', {}),
--     pattern = 'markdown',
--     callback = function()
--         -- sets local folding options for markdown
--         vim.opt_local.foldmethod = 'expr'
--         vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--     end,
-- })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not (client and client.name == "obsidian-ls") then
      return
    end

    for _, win in ipairs(vim.fn.win_findbuf(ev.buf)) do
      vim.wo[win][0].foldmethod = "expr"
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
      vim.wo[win][0].foldtext = "v:lua.vim.lsp.foldtext()"
    end
  end,
})
-- ┌───────────────────────────────────┐
-- │             Indentación           │
-- └───────────────────────────────────┘
-- o.tabstop = 4            -- Un TAB se ve como 4 espacios
o.expandtab = true -- Inserta espacios en lugar de TAB
-- o.softtabstop = 4 -- Espacios insertados en lugar de TAB
-- o.shiftwidth = 4 -- Tamaño de la indentación automática
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
