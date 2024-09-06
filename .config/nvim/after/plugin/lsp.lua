local lsp_zero = require("lsp-zero")
local lsp = require("lsp-zero").preset({})
local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()

-- Fix Undefined global 'vim'
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- ********** lsp zero config **********

-- setting up mason
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"lua_ls",
		"jsonls",
		"jdtls",
	},
	handlers = {
		-- lsp_zero.default_setup,
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,

		jdtls = lsp_zero.noop,
	},
})

-- set auto completion for json using schema plugin
require("lspconfig").jsonls.setup({
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

-- Fix Undefined global 'vim'
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- lsp remap
lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>ld", function()
		vim.lsp.buf.definition()
	end, opts)

	vim.keymap.set("n", "<leader>la", function()
		vim.lsp.buf.code_action()
	end, opts)

	vim.keymap.set("n", "<leader>lR", function()
		vim.lsp.buf.rename()
	end, opts)

	vim.keymap.set("n", "<leader>lr", function()
		vim.lsp.buf.references()
	end, opts)

	vim.keymap.set("n", "<leader>li", function()
		vim.lsp.buf.implementation()
	end, opts)

	vim.keymap.set("n", "<leader>lh", function()
		vim.lsp.buf.hover()
	end, opts)

	vim.keymap.set("n", "<leader>lm", function()
		vim.diagnostic.open_float()
	end, opts)

	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)

	vim.keymap.set("n", "<leader>gp", function()
		vim.diagnostic.goto_prev()
	end, opts)

	vim.keymap.set("n", "<leader>gn", function()
		vim.diagnostic.goto_next()
	end, opts)
end)

-- set sign icons
lsp.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = {
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})

-- setting up cmp
cmp.setup({
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
		["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),
		["<C-e>"] = cmp.mapping.abort(),

		["<C-Space>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = "insert" })
			else
				cmp.complete()
			end
		end),
	},

	preselect = "item",

	window = {
		completion = {
			winhighlight = "FloatBorder:Pmenu,Search:None",

			col_offset = -3,
			side_padding = 0,
			border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
		},
		documentation = {
			winhighlight = "Normal:CmpDocNormal",
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			maxwidth = 0,
		},
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)

			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"

			return kind
		end,
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "luasnip" }, -- needed to enable luasnip
		{ name = "path" },
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})
