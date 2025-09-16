local lint = require("lint")

lint.linters_by_ft = {
	-- lua = { "luacheck" },
	-- yaml = {
	--   "yamllint",
	--   "actionlint",
	-- },
	-- codespell = { "codespell" },
	-- javascript = { "standardjs" },
	-- javascript = { "eslint_d" },
	-- typescript = { "eslint_d" },
	-- javascriptreact = { "eslint_d" },
	-- typescriptreact = { "eslint_d" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

--┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--┃            SHORTCUTE                  ┃
--┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })

-- Posible a Eliminar
