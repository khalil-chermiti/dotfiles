require("conform").setup({
	formatters_by_ft = {

		lua = { "stylua" },

		go = { "goimports", "gofmt", stop_after_first = true },

		python = { "ruff_format", "black", stop_after_first = true },

		json = { "biome", "prettier", stop_after_first = true },

		markdown = { "prettier" },

		javascript = { "biome", "prettier", stop_after_first = true },

		typescript = { "biome", "prettier", stop_after_first = true },

		javascriptreact = { "biome", "prettier", stop_after_first = true },

		typescriptreact = { "biome", "prettier", stop_after_first = true },

		css = { "prettier" },

		html = { "prettier" },

		toml = { "taplo" },
	},

	formatters = {

		biome = { require_cwd = true },
	},

	default_format_opts = {
		lsp_format = "fallback",
	},
})

vim.keymap.set({ "n", "v" }, "<leader>lf", function()
	require("conform").format(
		{ async = true } --,
		-- function(err, did_edit)
		--   if not err and did_edit then
		--     vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
		--   end
		-- end
	)
end, { desc = "Format buffer" })
