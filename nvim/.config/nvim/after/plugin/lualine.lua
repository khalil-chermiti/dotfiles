local function show_macro_recording()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	else
		return "Recording @" .. recording_register
	end
end

require("lualine").setup({
	-- disabled_filetypes = { 'packer', 'NVimTree' },
	extensions = {
		"toggleterm",
		"nvim-tree",
	},

	options = {
		section_separators = "",
		component_separators = "",
		globalstatus = true,
	},

	sections = {
		lualine_b = {
			{
				"macro-recording",
				fmt = show_macro_recording,
			},
		},
	},
})

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

-- source for showing macro recordings
-- https://www.reddit.com/r/neovim/comments/xy0tu1/cmdheight0_recording_macros_message/
