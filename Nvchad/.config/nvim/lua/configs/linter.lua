-- ┏━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃     Nvim-lint.nvim    ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━┛
local lint = require("lint")
vim.env.ESLINT_D_PPID = vim.fn.getpid()

lint.linters_by_ft = {
	-- lua = { "luacheck" },
	-- yaml = {
	--   "yamllint",
	--   "actionlint",
	-- },
	-- codespell = { "codespell" },

	--standardjs
	javascript = { "standardjs" },
	javascriptreact = { "standardjs" },
	-- javascriptreact = { "standardjs" },
	-- typescriptreact = { "standardjs" },
	--
	--eslint_d - Error
	-- javascript = { "eslint_d" },
	-- typescript = { "eslint_d" },
	-- javascriptreact = { "eslint_d" },
	-- typescriptreact = { "eslint_d" },

	-- eslint
	-- javascript = { "eslint" },

	-- svelte = { "eslint_d" },
	-- python = { "pylint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		if vim.b.lint_disabled then
			return
		end
		lint.try_lint()
	end,
})

--┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--┃            SHORTCUTE                  ┃
--┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

vim.keymap.set("n", "<leader>l1", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })

-- vim.keymap.set("n", "<leader>l2", function()
--     local current_buf = vim.api.nvim_get_current_buf()
--     local is_disabled = not vim.b.lint_disabled -- El nuevo estado
--
--     vim.b.lint_disabled = is_disabled
--
--     if is_disabled then
--         -- 1. Limpiar los resultados del linter que ya estaban visibles
--         vim.cmd("LspDiagnosticClear") -- Si usas LSP, ayuda a limpiar
--         vim.fn.setqflist({}) -- Limpia la quickfix list si nvim-lint la llenó
--         vim.notify("Linting DESACTIVADO para el buffer", vim.log.levels.INFO)
--     else
--         vim.notify("Linting ACTIVADO para el buffer", vim.log.levels.INFO)
--         -- 2. Ejecutar inmediatamente el linter al reactivar
--         lint.try_lint({ buf = current_buf })
--     end
-- end, {
-- 	noremap = true,
-- 	silent = true,
-- 	desc = "Toggle nvim-lint (buffer)",
-- })
