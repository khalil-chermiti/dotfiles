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
	horiz = "─",
}

-- system clipboard
opt.clipboard:append("unnamedplus")

-- cmd
-- vim.cmd("set cmdheight=0")
vim.cmd.filetype("plugin indent on")

vim.cmd("set cmdheight=0")

-- globals
vim.g.netrw_liststyle = 1
vim.g.netrw_sort_by = "size"

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = true,
  virtual_text = {
    spacing = 2,
    source = 'if_many',
    prefix = '●',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.INFO] = 'I',
      [vim.diagnostic.severity.HINT] = 'H',
    },
  },
})

local function get_diagnostics()
	local diagnostics = {
		{ severity = vim.diagnostic.severity.ERROR, sign = "✘ " },
		{ severity = vim.diagnostic.severity.WARN, sign = " " },
		{ severity = vim.diagnostic.severity.INFO, sign = "󰋽 " },
		{ severity = vim.diagnostic.severity.HINT, sign = "󰌵 " },
	}

	local parts = {}
	for _, entry in ipairs(diagnostics) do
		local count = #vim.diagnostic.get(0, { severity = entry.severity })
		if count > 0 then
			table.insert(parts, entry.sign .. count)
		end
	end

	return #parts > 0 and (" " .. table.concat(parts, " ") .. " ") or ""
end

-- Make the function global so the statusline can see it
_G.get_diagnostics = get_diagnostics

vim.opt.statusline = table.concat({
	" %f", -- filename
	" [%{mode()}]", -- mode
	" %m", -- modified flag
	" %{reg_recording() == '' ? '' : '@' .. reg_recording()}", -- recording macro
	"%=", -- right align
	"%{%v:lua.get_diagnostics()%}", -- LSP DIAGNOSTICS
	" %l:%c", -- line:column
	" %p%% ", -- percentage
})
-- activate quickfix filter
vim.cmd("packadd cfilter")
