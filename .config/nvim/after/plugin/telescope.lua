local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

-- press q to quit
require('telescope').setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- search only git files ("excludes anything in .gitignore")
vim.keymap.set('n', '<leader>fs', builtin.git_files, {})