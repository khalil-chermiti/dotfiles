local dark_theme = "onedark"
local light_theme = "onelight"

local function apply_theme()
	local color_scheme = vim.fn.system("gsettings get org.gnome.desktop.interface color-scheme"):gsub("%s+", "")

	if color_scheme == "'prefer-dark'" then
		vim.o.background = "dark"
		vim.cmd.colorscheme(dark_theme)
		vim.cmd.colorscheme(dark_theme)
	else
		vim.o.background = "light"
		vim.cmd.colorscheme(light_theme)
		vim.cmd.colorscheme(light_theme)
	end
end

-- Initial load
apply_theme()

-- on focus, re-apply the theme to catch any changes in the system theme
vim.api.nvim_create_autocmd("FocusGained", {
	callback = function()
		apply_theme()
	end,
})
