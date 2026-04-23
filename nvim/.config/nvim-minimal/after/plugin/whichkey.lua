local wk = require("which-key")

local defaults = {
	preset = "modern",

	delay = function(ctx)
		return ctx.plugin and 0 or 200
	end,

	filter = function(mapping)
		return true
	end,

	spec = {},

	notify = true,

	triggers = {
		{ "<auto>", mode = "nxsot" },
	},

	defer = function(ctx)
		return ctx.mode == "V" or ctx.mode == "<C-V>"
	end,
	plugins = {
		marks = true,
		registers = true,

		spelling = {
			enabled = true,
			suggestions = 20,
		},

		presets = {
			operators = true,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},

	win = {
		no_overlap = true,

		padding = { 1, 2 },
		title = true,
		title_pos = "center",
		zindex = 1000,

		bo = {},
		wo = {},
	},
	layout = {
		width = { min = 20 },
		spacing = 3,
	},
	keys = {
		scroll_down = "<c-d>",
		scroll_up = "<c-u>",
	},

	sort = { "local", "order", "group", "alphanum", "mod" },

	expand = 0,

	replace = {
		key = {
			function(key)
				return require("which-key.view").format(key)
			end,
		},
		desc = {
			{ "<Plug>%(?(.*)%)?", "%1" },
			{ "^%+", "" },
			{ "<[cC]md>", "" },
			{ "<[cC][rR]>", "" },
			{ "<[sS]ilent>", "" },
			{ "^lua%s+", "" },
			{ "^call%s+", "" },
			{ "^:%s*", "" },
		},
	},
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
		ellipsis = "…",

		mappings = true,

		rules = {},

		colors = true,

		keys = {
			Up = " ",
			Down = " ",
			Left = " ",
			Right = " ",
			C = "󰘴 ",
			M = "󰘵 ",
			D = "󰘳 ",
			S = "󰘶 ",
			CR = "󰌑 ",
			Esc = "󱊷 ",
			ScrollWheelDown = "󱕐 ",
			ScrollWheelUp = "󱕑 ",
			NL = "󰌑 ",
			BS = "󰁮",
			Space = "󱁐 ",
			Tab = "󰌒 ",
			F1 = "󱊫",
			F2 = "󱊬",
			F3 = "󱊭",
			F4 = "󱊮",
			F5 = "󱊯",
			F6 = "󱊰",
			F7 = "󱊱",
			F8 = "󱊲",
			F9 = "󱊳",
			F10 = "󱊴",
			F11 = "󱊵",
			F12 = "󱊶",
		},
	},

	show_help = true,
	show_keys = true,

	disable = {
		ft = {},
		bt = {},
	},
	debug = false,
}

wk.setup(defaults)

wk.add({
	{ "<leader>e", desc = "toggle explorer" },

	{ "<leader>l", group = "lsp" },
	{ "<leader>ld", desc = "definition" },
	{ "<leader>la", desc = "code actions" },
	{ "<leader>lR", desc = "rename" },
	{ "<leader>lr", desc = "references" },
	{ "<leader>li", desc = "implementations" },
	{ "<leader>lh", desc = "hover" },
	{ "<leader>lf", desc = "format" },
	{ "<leader>lm", desc = "diagnostic" },
	{ "Ctlh", desc = "signature help" },

	{ "<leader>g", group = "diagnostic" },
	{ "<leader>gn", desc = "next" },
	{ "<leader>gp", desc = "prev" },

	{ "<leader>f", group = "telescope" },
	{ "<leader>ff", desc = "find files" },
	{ "<leader>fb", desc = "find buffers" },
	{ "<leader>fs", desc = "live grep" },
	{ "<leader>fg", desc = "search git" },
	{ "<leader>fc", desc = "search changes" },

	{ "<leader>t", group = "trouble" },
	{ "<leader>td", desc = "diagnostics" },
	{ "<leader>tq", desc = "quickfix" },
	{ "<leader>tr", desc = "references" },
	{ "<leader>ti", desc = "implementations" },

	{
		mode = { "n", "v" },
		{ "<leader>c", group = "conform" },
		{ "<leader>ct", desc = "toggle autoformat" },
		{ "<leader>cn", desc = "conform info" },
		{ "<leader>cf", desc = "format buffer" },
		{ "<leader>cF", desc = "format injected langs" },
	},

	{
		mode = "n",
		{ "<leader>p", group = "pack" },
		{ "<leader>pu", "<cmd>lua vim.pack.update()<cr>", desc = "Update Plugins" },
	},

	{
		mode = "n",
		{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
	},

	{
		mode = "n",
		{ "<leader>b", group = "buffers" },
		{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>bd", "<cmd>bd<cr>", desc = "Buffer Delete" },
	},

	{
		mode = "n",
		{ "<leader>hs", desc = "Stage Hunk" },
		{ "<leader>h", group = "gitsigns" },
		{ "<leader>hr", desc = "Reset Hunk" },

		{ "<leader>hp", desc = "Preview Hunk" },
		{ "<leader>hS", desc = "Stage Buffer" },
		{ "<leader>hR", desc = "Reset Buffer" },
	},

	-- slash nvim command
	{
		mode = "n",
		{ "<leader>s", desc = "Flash" },
	},

	{
		mode = { "n", "v" },
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
		{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
	},
})
