-- 2. Standard Mason setup
require("mason").setup({})
require("mason-lspconfig").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"yamlls",
		"vtsls",
		"biome",
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim", "require" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

vim.lsp.config("vtsls", {
	settings = {
		typescript = {
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
			implementationsCodeLens = { enabled = true },
			referencesCodeLens = { enabled = true },
		},
		javascript = {
			implementationsCodeLens = { enabled = true },
			referencesCodeLens = { enabled = true },
		},
	},
})
