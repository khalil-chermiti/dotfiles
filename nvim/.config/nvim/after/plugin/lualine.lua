require("lualine").setup({
  options = {
    theme = "auto",
    section_separators = "",
    component_separators = "",
  },
  sections = {
    lualine_a = {},
    lualine_b = {},

    lualine_c = {
      {
        "filename",
        path = 0, -- just filename
      },
      {
        function()
          local reg = vim.fn.reg_recording()
          if reg == "" then return "" end
          return "REC @" .. reg
        end,
      },
    },

    lualine_x = {
      "progress", -- % through file
    },

    lualine_y = {
      "location", -- line:column
    },

    lualine_z = {},
  },

	extensions = {
		"toggleterm",
		"nvim-tree",
	},
})
