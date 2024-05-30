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
		lsp_zero.default_setup,
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

-- setting java
require("java").setup()
require("lspconfig").jdtls.setup({})

-- lsp remap
lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.definition() end, opts)

	vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)

	vim.keymap.set("n", "<leader>lR", function() vim.lsp.buf.rename() end, opts)

	vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end , opts)

  vim.keymap.set('n', '<leader>li', function() vim.lsp.buf.implementation() end, opts)

	vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, opts)

	vim.keymap.set("n", "<leader>lm", function() vim.diagnostic.open_float() end, opts)

	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  vim.keymap.set('n', '<leader>gp', function() vim.diagnostic.goto_prev() end, opts)

  vim.keymap.set('n', '<leader>gn', function() vim.diagnostic.goto_next() end, opts)
end)

-- set sign icons
lsp.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

lsp.setup()

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
			-- activate line highlight for completion window
			-- winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",

			-- disable line highlight for completion window
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

	-- formatting = {
	-- 	fields = { "abbr", "kind", "menu" },
	-- 	format = require("lspkind").cmp_format({
	-- 		mode = "symbol", -- show only symbol annotations
	-- 		maxwidth = 50, -- prevent the popup from showing more than provided characters
	-- 		ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
	-- 	}),
	-- },

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
		{ name = "nvim_lsp", priority = 10000 },
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

