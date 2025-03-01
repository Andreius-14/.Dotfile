local nvimlint = require("lint")

nvimlint.linters_by_ft = {
	-- lua = { "luacheck" },
	-- yaml = {
	--   "yamllint",
	--   "actionlint",
	-- },
	-- codespell = { "codespell" },
	javascript = { "standardjs" }
	-- typescript = { "eslint_d" },
	-- javascriptreact = { "eslint_d" },
	-- typescriptreact = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		nvimlint.try_lint()
	end,
})
