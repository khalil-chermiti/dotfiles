require("lensline").setup({
	profiles = {
		{
			name = "basic",
			providers = {
				{
					name = "usages",
					enabled = true,
					show_zero = false,
					include = {
						"refs",
						"defs",
						"impls",
					},
					breakdown = true,
				},
				{ name = "diagnostics", enabled = true, min_level = "HINT" },
				{ name = "complexity", enabled = false },
			},
			style = { render = "all", placement = "above", prefix = "" }, -- inline
		},
	},
})

vim.cmd("LenslineDisable") -- disable by default
