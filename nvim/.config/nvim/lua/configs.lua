local opt = vim.opt

-- leader
vim.g.mapleader = " "

-- disable providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

-- ui
opt.number = true
opt.relativenumber = false
opt.cursorline = false
opt.signcolumn = "yes"
opt.termguicolors = true
opt.pumheight = 10
opt.scrolloff = 8
opt.numberwidth = 2
opt.colorcolumn = ""
-- opt.winborder = "rounded"
opt.list = false

-- search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.inccommand = "nosplit"

-- indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftround = true

-- behavior
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.updatetime = 50
opt.isfname:append("@-@")

-- undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- folds
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = "0"

-- fill chars
opt.fillchars = {
  eob = " ",
  vert = "│",
}

-- system clipboard
vim.opt.clipboard:append("unnamedplus")

-- cmd
-- vim.cmd("set cmdheight=0")
vim.cmd.filetype("plugin indent on")

vim.cmd("set cmdheight=0")

-- globals
vim.g.netrw_liststyle = 1
vim.g.netrw_sort_by = "size"

-- ui2
-- local ok_ui2, ui2 = pcall(require, "vim._core.ui2")
-- if ok_ui2 and type(ui2.enable) == "function" then
--   ui2.enable({
--     enable = true,
--     msg = {
--       targets = "cmd",
--       timeout = 4000,
--     },
--   })
-- end
