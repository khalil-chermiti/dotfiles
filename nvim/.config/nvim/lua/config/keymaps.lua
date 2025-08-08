-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>", { desc = "Map jj to Escape" })

vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>K")
vim.keymap.del("n", "<leader>L")
