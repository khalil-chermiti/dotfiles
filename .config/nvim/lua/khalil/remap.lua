-- toggling nvim tree
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>ef", vim.cmd.NvimTreeFocus)

-- switching buffers
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePick<CR>")
vim.keymap.set("n", "<leader>c", "<cmd>Bdelete<CR>")

-- resizing windows
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +2<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<CR>")

-- switching tabs
vim.keymap.set("n", "<C-l>", "<C-w>l") -- switch to right tab
vim.keymap.set("n", "<C-h>", "<C-w>h") -- switch to left tab
vim.keymap.set("n", "<C-j>", "<C-w>j") -- switch to top tab
vim.keymap.set("n", "<C-k>", "<C-w>k") -- switch to bottom tab

-- toggleterm remap
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>")
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>")

-- moving lines up and down
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==")

vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi")

vim.keymap.set("v", "<A-j>", ":m'>+<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m-2<CR>gv=gv")
