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
		lint.try_lint()
	end,
})

--┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
--┃            SHORTCUTE                  ┃
--┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
