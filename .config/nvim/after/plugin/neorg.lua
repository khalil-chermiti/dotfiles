require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {
			config = {
				icon_preset = "varied",
				icons = {
					code_block = {
						conceal = true,
					},
				},
			},
		},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/workspace/notes",
				},
			},
		},
	},
})
