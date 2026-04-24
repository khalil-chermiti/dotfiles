---@type vim.lsp.Config
return {
	cmd = { "vtsls", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },

	-- Tell the server that blink.cmp is our client
	capabilities = require("blink.cmp").get_lsp_capabilities(),

	settings = {
		vtsls = {
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
			typescript = {
				completion = {
					importModuleSpecifierPreference = "non-relative",
				},

				suggest = {
					completeFunctionCalls = true,
				},
			},
			javascript = {
				suggest = {
					completeFunctionCalls = true,
				},
			},
		},
	},
}
