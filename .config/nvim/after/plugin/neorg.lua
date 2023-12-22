require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.concealer"] = {
			config = {
        icon_preset = "varied"
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
