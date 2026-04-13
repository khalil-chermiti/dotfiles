vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				text = "NvimTree",
				separator = true,
				text_align = "center",
			},

			{
				filetype = "Oil",
				text = "Oil",
				separator = true,
				text_align = "center",
			},
		},

		always_show_bufferline = true,
		enforce_regular_tabs = true,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,

		indicator = {
			icon = "▎",
			style = "icon",
		},

		-- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
		separator_style = "thin",
		show_close_icon = true,
		show_buffer_close_icons = true,
	},
})
