-- 1. Ensure Mason binaries are in the system path
-- vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

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
			updateImportsOnFileMove = { enabled = "always" },
			inlayHints = {
				parameterNames = { enabled = "all" },
				variableTypes = { enabled = true },
			},
		},
	},
})

-- vim.lsp.config("tailwindcss", {
-- 	root_dir = vim.fs.root(0, {
-- 		"tailwind.config.js",
-- 		"tailwind.config.ts",
-- 		"postcss.config.js",
-- 		"package.json",
-- 		".git",
-- 	}),
-- 	settings = {
-- 		tailwindCSS = {
-- 			-- Optional: explicitly tell it not to scan certain massive folders
-- 			files = {
-- 				exclude = { "**/.git/**", "**/node_modules/**", "**/.nuxt/**" },
-- 			},
-- 		},
-- 	},
-- })

vim.lsp.enable({ "lua_ls", "vtsls", "yamlls", "biome", "tailwindcss" })
