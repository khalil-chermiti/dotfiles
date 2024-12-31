local function show_macro_recording()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	else
		return "Recording @" .. recording_register
	end
end

vim.api.nvim_create_autocmd("RecordingEnter", {
	callback = function()
		require("lualine").refresh({
			place = { "statusline" },
		})
	end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		local timer = vim.loop.new_timer()
		timer:start(
			50,
			0,
			vim.schedule_wrap(function()
				require("lualine").refresh({
					place = { "statusline" },
				})
			end)
		)
	end,
})

-- require("lualine").setup({
-- 	-- disabled_filetypes = { 'packer', 'NVimTree' },
-- 	extensions = {
-- 		"toggleterm",
-- 		"nvim-tree",
-- 	},
--
-- 	options = {
-- 		section_separators = "",
-- 		component_separators = "",
-- 		globalstatus = true,
-- 	},
--
-- 	sections = {
-- 		lualine_b = {
-- 			{
-- 				"macro-recording",
-- 				fmt = show_macro_recording,
-- 			},
-- 		},
-- 	},
-- })

-- source for showing macro recordings
-- https://www.reddit.com/r/neovim/comments/xy0tu1/cmdheight0_recording_macros_message/

local colors = {
	blue = "#80a0ff",
	cyan = "#79dac8",
	black = "#080808",
	white = "#c6c6c6",
	red = "#ff5189",
	violet = "#d183e8",
	grey = "#303030",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white },
	},
}

require("lualine").setup({
	options = {
		theme = bubbles_theme,
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
		lualine_b = {
			{
				"macro-recording",
				fmt = show_macro_recording,
			},
		},
		lualine_c = {
			"branch",
		},
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},

	extensions = {
		"toggleterm",
		"nvim-tree",
	},
})
