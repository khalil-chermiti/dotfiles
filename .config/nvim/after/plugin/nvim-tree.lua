-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",

  view = {
    adaptive_size = true,
  },

  actions = {
    open_file = {
      quit_on_open = true,
    }
  },

  renderer = {
    group_empty = true,
    root_folder_label = false,
  },

  filters = {
    dotfiles = false,
  },

})
