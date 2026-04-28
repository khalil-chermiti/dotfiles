local harpoon = require("harpoon")

harpoon:setup({})

vim.keymap.set("n", "<leader>m", function()
	harpoon:list():add()
end, { desc = "Add to Harpoon" })

vim.keymap.set("n", "<leader>fh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle Harpoon" })
