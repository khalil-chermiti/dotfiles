local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		lua = { "stylua" },
		tex = { "latexindent" },
	},
	-- format_on_save = {
	--   lsp_fallback = true,
	--   async = false,
	--   timeout_ms = 500,
	-- },
})

vim.keymap.set({ "n", "v" }, "<leader>lf", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "format" })
