local harpoon = require("harpoon")
local oil = require("oil")

harpoon:setup({
	settings = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	},
	default = {
		-- opening harpoon item based on type (file/dir)
		select = function(list_item, _, _)
			local path = list_item.value
			if vim.fn.isdirectory(path) == 1 then
				require("oil").open(path)
			else
				vim.cmd("edit " .. path)
			end
		end,
	},
})

-- adding either a file or an Oil dir path to harpoon
vim.keymap.set("n", "<leader>m", function()
	local dir = oil.get_current_dir()
	if dir then
		harpoon:list():add({
			value = dir,
		})
	else
		harpoon:list():add()
	end
end, { desc = "Add Oil dir to Harpoon" })

vim.keymap.set("n", "<leader>fh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
