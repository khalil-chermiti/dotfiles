local wk = require("which-key")

wk.setup({
	window = {
		border = "single",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 1, 2, 1, 2 },
	},
	layout = {
		align = "left",
	},
})

wk.register({
	T = {
		name = "Tabs",
		p = "prev tab",
		n = "next tab",
		c = "close tab",
	},

	c = "close buffer",

	b = {
		name = "Buffer",
		n = "next",
		p = "previous",
		c = "chose",
	},

	e = "toggle explorer",

	l = {
		name = "lsp",
		d = "definition",
		a = "code actions",
		R = "rename",
		r = "references",
		i = "implementations",
		h = "hover",
		f = "format",
		m = "diagnostic",
		Ctlh = "signature help",
	},

	g = {
		name = "diagnostic",
		n = "next",
		p = "prev",
	},

	f = {
		name = "telescope",
		f = "find files",
		b = "find buffers",
		g = "live grep",
		h = "search help",
		s = "search git",
	},

	z = {
		name = "true zen",
		a = "ataraxis",
		f = "focus",
		m = "minimalist",
	},

	t = {
		name = "trouble",
		t = "toggle",
		w = "workspace diagnostics",
		d = "document diagnostics",
		q = "quickfix",
		r = "lsp references",
		i = "lsp implementations",
	},
}, {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
	expr = false,
})
