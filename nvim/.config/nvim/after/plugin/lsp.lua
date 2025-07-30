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

-- ********** Basic LSP Setup **********

-- Reserve a space in the gutter to avoid layout shift
vim.opt.signcolumn = "yes"

-- Add borders to floating windows
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- Add cmp_nvim_lsp capabilities settings to lspconfig
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- ********** Mason Setup **********
require("mason").setup({})
require("mason-lspconfig").setup({

	automatic_installation = true, -- if you want automatic installation
	ensure_installed = {
		"ts_ls",
		"lua_ls",
		"jsonls",
		-- "jdtls",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		-- jdtls = require("lsp-zero").noop,
	},
})

-- ********** Language Server Configurations **********

-- JSON with schemastore
require("lspconfig").jsonls.setup({
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

-- Lua LSP config
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- OCaml LSP config
require("lspconfig").ocamllsp.setup({
	settings = {
		ocaml = {
			standalone = true,
		},
	},
	root_dir = function(fname)
		return vim.fn.getcwd()
	end,
})

-- ********** LSP Keymaps **********
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "<leader>lm", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
		vim.keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
	end,
})

-- ********** Diagnostics Configuration **********
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

-- ********** nvim-cmp Configuration **********

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

-- Main cmp setup
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
			winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
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
		{ name = "luasnip" },
		{ name = "path" },
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})
