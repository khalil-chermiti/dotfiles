local keymaps = {
  explorer = {
    { mode = "n", keymap = "<leader>eo", action = "<cmd>NvimTreeToggle<cr>", desc = "toggle" },
    { mode = "n", keymap = "<leader>ef", action = "<cmd>NvimTreeFocus<cr>",  desc = "focus" },
  },

  buffer = {
    { mode = "n", keymap = "<leader>bn", action = "<cmd>BufferLineCycleNext<cr>", desc = "buffer next" },
    { mode = "n", keymap = "<leader>bp", action = "<cmd>BufferLineCyclePrev<cr>", desc = "buffer prev" },
    { mode = "n", keymap = "<leader>bc", action = "<cmd>BufferLinePick<cr>",      desc = "buffer pick" },
    { mode = "n", keymap = "<leader>c",  action = "<cmd>Bdelete<CR>",             desc = "buffer close" },
  },

  tabs= {
    { mode = "n", keymap = "<leader>Tn", action = "<cmd>tabNext<cr>",      desc = "next tab" },
    { mode = "n", keymap = "<leader>Tp", action = "<cmd>tabprevious<cr>",      desc = "prev tab" },
    { mode = "n", keymap = "<leader>Tc", action = "<cmd>tabclose<cr>",     desc = "close tab" },
  },

  resize = {
    { mode = "n", keymap = "<C-up>",    action = "<cmd>resize +2<cr>",          desc = "h +2" },
    { mode = "n", keymap = "<C-down>",  action = "<cmd>resize -2<cr>",          desc = "h -2" },
    { mode = "n", keymap = "<C-left>",  action = "<cmd>vertical resize +2<cr>", desc = "v +2" },
    { mode = "n", keymap = "<C-right>", action = "<cmd>vertical resize -2<cr>", desc = "v -2" },
  },

  navigate = {
    { mode = "n", keymap = "<C-l>", action = "<C-w>l", desc = "pane left" },
    { mode = "n", keymap = "<C-h>", action = "<C-w>h", desc = "pane right" },
    { mode = "n", keymap = "<C-j>", action = "<C-w>j", desc = "pane up" },
    { mode = "n", keymap = "<C-k>", action = "<C-w>k", desc = "pane down" },
  },

  terminal = {
    { mode = "n", keymap = "<leader>tf", action = "<cmd>ToggleTerm direction=float<cr>",      desc = "float" },
    { mode = "n", keymap = "<leader>tv", action = "<cmd>ToggleTerm direction=vertical<cr>",   desc = "vertical tab" },
    { mode = "n", keymap = "<leader>th", action = "<cmd>ToggleTerm direction=horizontal<cr>", desc = "horizontal tab" },
  },


  text = {
    { mode = "n", keymap = "<A-j>", action = "<cmd>m .+1<cr>==",        desc = "line down" },
    { mode = "n", keymap = "<A-k>", action = "<cmd>m .-2<cr>==",        desc = "line up" },
    { mode = "i", keymap = "<A-j>", action = "<Esc><cmd>m .+1<cr>==gi", desc = "line down" },
    { mode = "i", keymap = "<A-k>", action = "<Esc><cmd>m .-2<cr>==gi", desc = "line up" },
    { mode = "v", keymap = "<A-j>", action = ":m'>+<cr>gv=gv",          desc = "line down" },
    { mode = "v", keymap = "<A-k>", action = ":m-2<cr>gv=gv",           desc = "line up" },
  },

  true_zen = {
    { mode = "n", keymap = "<leader>zf", action = "<cmd>TZFocus<cr>",      desc = "focus" },
    { mode = "n", keymap = "<leader>za", action = "<cmd>TZAtaraxis<cr>",   desc = "ataraxis" },
    { mode = "n", keymap = "<leader>zm", action = "<cmd>TZMinimalist<cr>", desc = "minimalist" },
  },
}

-- save keymaps to env to be used later by whichkey
_G.keymaps = keymaps;

-- load keymaps
for _, mapping_group in pairs(keymaps) do
  for _, mapping in pairs(mapping_group) do
    vim.keymap.set(mapping.mode, mapping.keymap, mapping.action)
  end
end

return keymaps;
