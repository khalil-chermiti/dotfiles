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
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.pumheight = 10
opt.scrolloff = 8
opt.numberwidth = 2
opt.colorcolumn = "80"
opt.winborder = "rounded"
opt.list = false

-- search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
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

-- system clipboard
opt.clipboard = "unnamedplus"

-- cmd
vim.cmd("set cmdheight=0")
vim.cmd.filetype("plugin indent on")

-- globals
vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	float = {
		border = "rounded",
		source = "if_many",
	},
	underline = true,
	virtual_text = {
		spacing = 2,
		source = "if_many",
		prefix = "●",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.INFO] = "I",
			[vim.diagnostic.severity.HINT] = "H",
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
	" %r", -- readonly flag
	" %q", -- quickfix flag
	" %h", -- help flag
	"%=", -- right align
	"%{%v:lua.get_diagnostics()%}", -- LSP DIAGNOSTICS
	" %l:%c", -- line:column
	" %p%% ", -- percentage
})

-- activate quickfix filter
vim.cmd("packadd cfilter")

-- set search path
vim.opt.path:append("**")

-- ignore following paths
vim.opt.wildignore:append({
	"**/node_modules/**",
	"**/target/**",
	"**/dist/**",
	"**/.git/**",
	"**/build/**",
})

vim.opt.suffixesadd:append(".lua,.ts")

-- default is "rg --vimgrep -uu" the uu includes hidden and .gitignore
vim.opt.grepprg = "rg --vimgrep"

-- Custom function to format the quickfix display
_G.qf_filename = function(info)
	local items = vim.fn.getqflist({ id = info.id, items = 0 }).items
	local l = {}

	for i = info.start_idx, info.end_idx do
		local e = items[i]
		local fname = ""

		if e.bufnr ~= 0 then
			-- Get the full path and then extract just the tail (the filename)
			local fullpath = vim.api.nvim_buf_get_name(e.bufnr)
			fname = vim.fn.fnamemodify(fullpath, ":t")
		end

		-- Format the line: Filename | Line:Col | Text
		local str = string.format("%s | %d:%d | %s", fname, e.lnum, e.col, e.text:gsub("^%s*", ""))

		table.insert(l, str)
	end
	return l
end


