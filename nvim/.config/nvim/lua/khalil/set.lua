vim.g.mapleader = " "

-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.pumheight = 10

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

-- remove vertical split and end of buffer indicator
vim.opt.fillchars = {
	eob = " ",
	vert = "│",
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "0"

-- set keymap sequence timeout
vim.cmd("set cmdheight=0")

-- copy to system clipboard
vim.cmd("set clipboard+=unnamedplus")

-- remap tab to Ctrl + j for copilot
vim.cmd('imap <silent><script><expr> <C-j> copilot#Accept("")')
vim.cmd("let g:copilot_no_tab_map = v:true")
vim.cmd("let g:copilot_enabled = v:false")

-- disable auto commenting when returning to line
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

vim.cmd.colorscheme("catppuccin")
vim.cmd.colorscheme("catppuccin")
